# MoonBit Formal Verification with `moon prove`

This project demonstrates MoonBit's experimental `moon prove` command, which
enables formal verification of MoonBit programs by lowering specifications to
[Why3](https://why3.lri.fr/) and discharging proof obligations with the
[Z3](https://github.com/Z3Prover/z3) SMT solver.

## How it works

The pipeline has three stages:

```
 .mbt + .mbtp          moonc prove             Why3 + Z3
┌────────────┐      ┌──────────────┐      ┌──────────────┐
│ Source code │ ───► │ Generate     │ ───► │ Prove goals  │
│ + predicates│      │ WhyML (.mlw) │      │ via SMT      │
└────────────┘      └──────────────┘      └──────────────┘
```

### 1. User writes specifications

Each package contains two source files:

- **`.mbt`** — MoonBit code with contracts and loop invariants
- **`.mbtp`** — Predicate definitions used in contracts

**Predicates** (`.mbtp`) define logical properties using first-order logic:

```moonbit
predicate in_bounds(xs : FixedArray[Int], i : Int) {
  (0 <= i) && (i < xs.length())
}

predicate sorted(xs : FixedArray[Int]) {
  ∀ i : Int, ∀ j : Int,
    ((in_bounds(xs, i)) && (in_bounds(xs, j)) && (i <= j)) →
      xs[i] <= xs[j]
}
```

**Contracts** (`.mbt`) annotate functions with preconditions, postconditions,
and loop invariants:

```moonbit
#requires(sorted(xs))
#ensures(lower_bound_ok(xs, key, result))
pub fn lower_bound(xs : FixedArray[Int], key : Int) -> Int {
  for lo = 0, hi = xs.length(); lo < hi; {
    let mid = lo + (hi - lo) / 2
    if xs[mid] < key {
      continue mid + 1, hi
    } else {
      continue lo, mid
    }
  } nobreak {
    lo
  } where {
    invariant: 0 <= lo,
    invariant: lo <= hi,
    invariant: hi <= xs.length(),
    invariant: all_less_before(xs, key, lo),
    invariant: all_geq_from(xs, key, hi),
  }
}
```

- `#requires(pred(...))` — precondition (assumed true on entry)
- `#ensures(pred(..., result))` — postcondition (must hold on exit; `result`
  refers to the return value)
- `where { invariant: expr, ... }` — loop invariants (must hold at every
  iteration boundary)

### 2. Lowering to WhyML

`moonc prove` compiles each package's `.mbt` + `.mbtp` into a WhyML module
(`.mlw`) under `_build/verif/<pkg>/`. The key transformations are:

| MoonBit | WhyML |
|---------|-------|
| `FixedArray[Int]` | `array int` |
| `xs.length()` | `xs.length` |
| `xs[i]` | `xs[i]` |
| `&&` / `\|\|` | `/\` / `\/` |
| `∀ x : Int,` | `forall x : int.` |
| `→` | `->` |
| `for` loop | `while` loop with `ref` variables |
| loop invariants | `invariant { ... }` clauses |
| `#requires` / `#ensures` | `requires { ... }` / `ensures { ... }` |

The compiler also auto-generates a **termination variant** for each loop
(e.g. `variant { hi - lo }` for a loop with condition `lo < hi`), and links
all predicates from the `.mbtp` file with Why3's `with` keyword for mutual
recursion.

Integers are mathematical (unbounded) in Why3, so there are no overflow
concerns. The WhyML modules import `int.Int`, `int.ComputerDivision`,
`ref.Ref`, and `array.Array` from the Why3 standard library.

### 3. Proving with Why3 + Z3

Why3 breaks the WhyML specification into individual **proof obligations**
(goals). Each goal is a logical formula that Z3 must discharge. Typical goals:

- **Loop invariant initialization** — invariant holds before the first iteration
- **Loop invariant preservation** — if invariant holds before an iteration and
  the loop condition is true, it holds after the iteration body
- **Postcondition** — the ensures clause holds when the function returns
- **Termination** — the variant decreases and stays non-negative
- **Array bounds** — array accesses are within bounds

The proving strategy (`MoonBit_Auto` in `_build/verif/why3.conf`) runs Z3 in
multiple passes with increasing timeouts:

```
Z3 @ 0.2s, 1000 MB   →  quick wins
Z3 @ 1s,   1000 MB   →  moderate goals
compute_specified      →  unfold definitions
split_vc               →  break conjunction goals apart
Z3 @ 2s,   4000 MB   →  harder goals
```

Results are written to `_build/verif/<pkg>/<pkg>.proof.json` with per-goal
status (valid, timeout, unknown, etc.).

## Running

```sh
moon prove
```

This verifies all packages in the workspace. Output shows per-package results
and a summary of total goals proved.

On the current branch, `moon prove` verifies **136 packages** and **966 goals**.

## Examples

The workspace now contains **136 proof packages** spanning branch reasoning,
closed-form loop invariants, quantified array properties, and multiple flavors
of binary search.

### Branch-only proofs

`abs`, `maxfn`, `clamp`

### Search, witness extraction, and partition proofs

`find`, `findlast`, `first_mismatch`, `first_reverse_mismatch`,
`first_descent`, `first_duplicate_sorted`, `zzok`, `afail`, `invpred`,
`lowerbound`, `upperbound`, `predecessor_search`, `bit_partition_point`,
`rotation_pivot`, `mountain_peak`, `closest_zero_sorted`,
`closest_key_sorted`, `closest_key_total`, `last_key_sorted`,
`closest_pair_sorted`,
`isqrt`, `div`, `cubicroot`, `fourth_root`

Highlights:

- `predecessor_search` proves a full split: everything up to `result` is
  `<= key`, everything after is `> key`.
- `bit_partition_point` is a specialized lower-bound proof over monotone 0/1
  arrays.
- `rotation_pivot` and `mountain_peak` use binary search to recover structural
  boundaries in nontrivial array shapes.
- `closest_zero_sorted`, `closest_key_sorted`, and `closest_key_total` prove
  global nearest-neighbor witness properties from binary-search splits,
  including the endpoint cases where the key lies outside the array range.
- `last_key_sorted` proves a last-occurrence witness via upper-bound search.
- `closest_pair_sorted` proves the classic theorem that, in a sorted array, a
  globally closest pair can be taken to be adjacent.
- `first_descent` and `first_duplicate_sorted` return concrete witnesses rather
  than boolean flags.

### Closed-form sums and sequence identities

`gauss`, `sumeven`, `sumodd`, `sumproduct`, `arith_prog`, `geom_series`,
`sum_squares`, `sum_cubes`, `sum_fourth_powers`, `sum_fifth_powers`,
`sum_sixth_powers`, `sum_seventh_powers`, `sum_eighth_powers`,
`sum_ninth_powers`, `sum_tenth_powers`, `sum_eleventh_powers`,
`odd_squares`, `sum_triples`,
`falling_products`, `odd_cubes`, `fibonacci`, `fib_prefix_sum`,
`fib_squared_sum`, `cassini`, `pell_cassini`, `lucas_cassini`,
`bernoulli_ineq`, `cauchy2`, `cauchy3`, `cauchy4`, `cauchy5`, `cauchy6`,
`cauchy7`, `cauchy8`, `cauchy9`, `cauchy10`, `cauchy11`, `cauchy12`,
`cauchy13`, `cauchy14`, `cauchy15`, `cauchy16`, `cauchy17`, `cauchy18`,
`cauchy19`, `cauchy20`, `cauchy21`, `cauchy22`, `cauchy23`, `cauchy24`,
`cauchy25`, `cauchy26`, `cauchy27`, `cauchy28`, `cauchy29`, `cauchy30`,
`cauchy31`, `cauchy32`, `lagrange4sq`,
`variance4`, `variance5`, `variance6`, `variance7`, `variance8`, `variance9`,
`variance10`, `variance11`, `variance12`, `variance13`, `variance14`,
`variance15`, `variance16`, `variance17`, `variance18`, `variance19`,
`variance20`, `variance21`, `variance22`, `variance23`, `variance24`,
`variance25`, `variance26`, `variance27`, `variance28`, `variance29`,
`variance30`, `variance31`, `variance32`, `variance33`, `variance34`

Highlights:

- `sum_cubes`, `sum_fourth_powers`, `sum_fifth_powers`,
  `sum_sixth_powers`, `sum_seventh_powers`, `sum_eighth_powers`,
  `sum_ninth_powers`, `sum_tenth_powers`, `sum_eleventh_powers`,
  `odd_squares`, `sum_triples`, and `odd_cubes` all use nonlinear polynomial
  invariants with exact postconditions.
- `cassini`, `pell_cassini`, and `lucas_cassini` prove alternating-sign
  identities over three different recurrence-derived quadratic forms.
- `cauchy2` through `cauchy32` prove exact Cauchy-Schwarz identities in
  dimensions 2 through 32, not just the final nonnegativity inequality.
- `lagrange4sq` proves Lagrange's four-square identity, i.e. norm
  multiplicativity for quaternion-style multiplication.
- `variance4` through `variance34` prove exact finite-dimensional variance
  identities as sums of pairwise squares.

### Quantified array invariants and inequalities

`count`, `arreq`, `checksorted`, `monotone`, `palindrome`, `prefix_sum_pos`,
`sumbounds`, `markov_bound`, `abs_sum_bound`, `abs_sum_dominates_each`,
`pairwise_sum_monotone`, `sorted_dot_lower`, `total_variation`,
`tv_diameter`, `telescoping_diff`, `maxarr`, `minarr`, `minmax_gap`,
`maxprofit`

Highlights:

- `maxprofit` and `minmax_gap` use quantified optimality/bounding arguments.
- `abs_sum_dominates_each` proves a computed value bounds every element's
  absolute value.
- `tv_diameter` strengthens total variation to an all-pairs bound over the
  entire array.
- `telescoping_diff` and `total_variation` show two different ways of proving
  endpoint facts from adjacent differences.

## Known limitations

See [TODO.md](TODO.md) for detailed writeups. Summary:

1. **Sequential `continue` assignment** — `continue i + 1, i` sets the second
   variable to the *updated* `i`. Use a `let` binding to capture the old value.

2. **`#requires` / `#ensures` only accept predicate calls** — inline
   expressions like `#requires(lo <= hi)` are a syntax error. Define a named
   predicate in `.mbtp`.

3. **`∀` must be at the top level of a predicate body** — cannot be nested
   inside `&&`. Move conditions into the implication consequent instead.

4. **Loop variant requires `loopvar < expr` condition** — conditions like
   `r >= b` or `lo + 1 < hi` produce no termination variant. Use
   `lo < hi - 1` (recognized as `loopvar < expr`) or restructure the algorithm.
