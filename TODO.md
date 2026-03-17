# TODO / Known Issues

## Discovered Issues

### Sequential assignment in `continue` with multiple loop variables

When a `for` loop uses `continue expr1, expr2` where `expr2` references a variable
updated by `expr1`, the lowering to WhyML generates sequential assignments.
This means the second variable sees the **updated** value, not the original.

**Example:**

```moonbit
for i = 0, found = -1; i < xs.length(); {
  if xs[i] == key {
    continue i + 1, i   // found gets i+1, not i!
  } else {
    continue i + 1, found
  }
}
```

The WhyML lowers `continue i + 1, i` to:

```whyml
i <- (i + 1); found <- i   (* found = i+1, not the original i *)
```

**Workaround:** Use a `let` binding to capture the value before `continue`:

```moonbit
let new_found = if xs[i] == key { i } else { found }
continue i + 1, new_found
```

### `#requires` / `#ensures` only accept predicate calls

Inline boolean expressions like `#requires(lo <= hi)` cause a syntax error.
A named predicate must be defined in the `.mbtp` file and referenced by name.

```moonbit
// ✗ Does not work
#requires(lo <= hi)

// ✓ Works — define predicate in .mbtp
predicate valid_bounds(lo : Int, hi : Int) { lo <= hi }
// then in .mbt
#requires(valid_bounds(lo, hi))
```

### `∀` (forall) must be at the top level of a predicate body

The universal quantifier `∀` cannot be nested inside `&&`. It must appear
at the outermost level of the predicate body.

```moonbit
// ✗ Does not parse — ∀ nested inside &&
predicate is_max(xs : FixedArray[Int], idx : Int) {
  (0 <= idx) && (idx < xs.length()) &&
  (∀ k : Int, ((0 <= k) && (k < xs.length())) → xs[k] <= xs[idx])
}

// ✓ Works — ∀ at top level, extra conditions in the consequent
predicate is_max(xs : FixedArray[Int], idx : Int) {
  ∀ k : Int, ((0 <= k) && (k < xs.length())) →
    ((xs[k] <= xs[idx]) && (0 <= idx) && (idx < xs.length()))
}
```

### Loop variant auto-generation requires `loopvar < expr` condition pattern

The termination variant is only auto-generated when the loop condition matches
the pattern `loopvar < expr` (e.g. `i < j`, `i < xs.length()`). Other patterns
like `(r + 1) * (r + 1) <= n` or `r >= b` produce **no variant**, causing a
termination proof failure.

```moonbit
// ✗ No variant generated — condition is not `loopvar < expr`
for r = 0; (r + 1) * (r + 1) <= n; { continue r + 1 }
for r = a; r >= b; { continue r - b }

// ✗ Also fails — `lo + 1 < hi` has an expression on the left
for lo = 0, hi = n + 1; lo + 1 < hi; { ... }

// ✓ Works — `lo < hi - 1` is recognized as `loopvar < expr`
for lo = 0, hi = n + 1; lo < hi - 1; { ... }
```

**Workaround:** Restructure algorithms to use binary search patterns with
`lo < hi - 1` or `lo < hi` conditions. For example, integer square root and
division by subtraction can both be reformulated as binary search.

### Empty `moon.pkg` manifests are not JSON

After migrating from `moon.pkg.json` to `moon.pkg`, an "empty package config"
is an empty `moon.pkg` file. Writing `{}` causes a parse failure such as:

```text
Parsing error: UnexpectedToken(LBRACE ...)
```

**Workaround:** For packages with no special settings, create an empty
`moon.pkg` file instead of a JSON object.

### Contracted functions currently reject structured-result construction

While attempting an `equal_range` proof that returned both binary-search
boundaries, `moon prove` rejected direct array construction inside a
contracted function body:

```text
unsupported expression in contracted function body
```

It also rejected calling a plain helper constructor from the contracted body:

```text
only local contracted functions and primitive operators can be called
in contracted function bodies
```

**Current impact:** returning proof-relevant structured values (for example a
pair `[lb, ub]`) appears to be much harder than returning a single `Int`,
even when the proof obligations themselves are otherwise close to discharging.

### Prefix variance / array-form Cauchy induction currently times out

An attempted proof of the array inequality

```text
n * Σ x_i^2 >= (Σ x_i)^2
```

using the natural prefix invariant

```text
i * sqsum >= sum^2
```

got down to a single loop-invariant-preservation VC but timed out in `moon prove`.

**Current impact:** fixed-dimension exact identities like the 2D/3D Cauchy
proofs and 4-point variance identity verify fine, but the fully general
array-form induction still looks beyond the current automatic discharge limit.

### Two-stage rotated-array search still resists automatic discharge

An attempted proof of full search correctness in an anchor-partitioned rotated
sorted array got much closer than earlier versions, but `moon prove` still
stopped with one loop-invariant-preservation timeout and one unknown VC after
the split-finding search was composed with a second segment-restricted binary
search.

**Current impact:** `rotation_pivot` is fully proved and recovers the split
point as a global minimum witness, but strengthening that into a total
`found-or-minusone` rotated search proof still appears to need either better
auxiliary lemmas or stronger automation than the current pipeline provides.

### Larger proof runs can intermittently crash the Why3 server

While pushing on stronger examples like `closest_pair_sorted`, `variance8`,
`cauchy6`, and `lucas_cassini`, some package-local `moon prove <pkg>` runs
failed with socket errors such as:

```text
Connection error: client_connect: connection failed: No such file or directory
(socket_name=/var/.../why3server...sock)
```

These were not ordinary timeout/unknown results from a stable Why3 session;
the Why3 server process itself disappeared during proving. In the same session,
rerunning the package or proving the whole workspace could still succeed.

**Current impact:** high-complexity packages can be flaky even when they are
ultimately provable. If a package suddenly fails with a `why3server...sock`
connection error, rerunning `moon prove` may recover; this currently looks like
backend instability rather than a clean proof-theoretic limit.

### Some larger contracted loops can trigger a `moonc prove` ICE

While experimenting with recurrence proofs that carried several synchronized
state variables and paired quadratic-form invariants, `moonc prove` sometimes
crashed before producing an ordinary VC report:

```text
Error: Invalid_argument("String.sub / Bytes.sub")
```

This showed up on attempted packages like `fib_lucas_norm` and
`pell_lucas_norm`, which were structurally close to successful recurrence
proofs but used more loop state than the simpler verified examples.

**Current impact:** there is a compiler robustness ceiling in addition to the
solver/Why3 limits. When a proof attempt hits this shape, the practical
workaround is to simplify the loop state or switch to a non-iterative identity
package instead of trying to push the same contracted loop harder.

### Degree-12 Faulhaber preservation appears beyond the current automatic limit

An attempted `sum_twelfth_powers` package got past an initial compiler ICE once
the long invariant was moved into a named predicate, but it still timed out on
the single loop-invariant-preservation VC.

**Current impact:** the current stable line for exact power-sum loop proofs
reaches `sum_eleventh_powers`; the twelfth-power step currently looks just past
what `moon prove` + Why3 + Z3 will discharge automatically in this setup.
