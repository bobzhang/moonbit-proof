///|
/// Single-Pass Signal Analysis
///
/// Performs a comprehensive analysis of a discrete signal in one O(n) pass,
/// tracking SEVEN state variables and verifying SIXTEEN loop invariants
/// simultaneously. Combines four independent analysis techniques:
///
///   1. Total variation (sum of absolute adjacent changes)
///   2. Maximum absolute change (largest single step)
///   3. Band tracking (range of the running sum, all-pairs bound)
///   4. Sorted-order verification (boolean accumulation)
///
/// The proof establishes:
///   - TV >= 0 and TV <= max_change * (n-1)  (bounded from both sides)
///   - TV >= xs[i] - xs[j] for ALL pairs i, j  (doubly-quantified)
///   - If sorted: all adjacent pairs are non-decreasing
///
/// The doubly-quantified all-pairs bound comes from band tracking: every
/// partial sum xs[k] - xs[0] lies in [lo, hi], so any pairwise difference
/// xs[i] - xs[j] <= hi - lo <= TV.
pub fn signal_stats(
  xs : FixedArray[Int],
) -> Int where {
  proof_require: at_least_two(xs),
  proof_ensure: result => signal_ok(xs, result),
} {
  for i = 1, tv = 0, max_ch = 0, sum = 0, lo = 0, hi = 0, sorted = 1; i <
     xs.length(); {
    // ── Adjacent change ─────────────────────────────────────────
    let d = xs[i] - xs[i - 1]
    let abs_d = if d >= 0 { d } else { -d }

    // ── Total variation: accumulate |changes| ───────────────────
    let new_tv = tv + abs_d

    // ── Max absolute change ─────────────────────────────────────
    let new_max_ch = if abs_d > max_ch { abs_d } else { max_ch }

    // ── Telescoping sum: xs[i] - xs[0] ──────────────────────────
    let new_sum = sum + d

    // ── Band tracking: lo <= all partial sums <= hi ─────────────
    let new_lo = if new_sum < lo { new_sum } else { lo }
    let new_hi = if new_sum > hi { new_sum } else { hi }

    // ── Sorted check: monotone non-decreasing? ──────────────────
    let new_sorted = if d >= 0 { sorted } else { 0 }

    continue i + 1, new_tv, new_max_ch, new_sum, new_lo, new_hi, new_sorted
  } nobreak {
    tv
  } where {
    // ── Index bounds ────────────────────────────────────────────
    proof_invariant: 1 <= i,
    proof_invariant: i <= xs.length(),

    // ── Total variation: non-negative ───────────────────────────
    proof_invariant: tv >= 0,

    // ── Max change: non-negative ────────────────────────────────
    proof_invariant: max_ch >= 0,

    // ── Bounded variation: TV <= max_change * step_count ─────────
    proof_invariant: tv <= max_ch * (i - 1),

    // ── Telescoping identity ────────────────────────────────────
    proof_invariant: sum == xs[i - 1] - xs[0],

    // ── Triangle inequality: TV >= |sum| ────────────────────────
    proof_invariant: tv >= sum,
    proof_invariant: tv >= -sum,

    // ── Band bounds ─────────────────────────────────────────────
    proof_invariant: lo <= sum,
    proof_invariant: sum <= hi,
    proof_invariant: lo <= 0,
    proof_invariant: hi >= 0,

    // ── TV dominates the band width ─────────────────────────────
    proof_invariant: tv >= hi - lo,

    // ── All partial sums lie in the band (universally quantified)
    proof_invariant: prefix_in_band(xs, lo, hi, i - 1),

    // ── Sorted check ────────────────────────────────────────────
    proof_invariant: sorted == 0 || sorted == 1,
    proof_invariant: adj_sorted_when_ok(xs, sorted, i),
    proof_reasoning: (
      #| Seven state variables track four independent analyses simultaneously.
      #|
      #| TOTAL VARIATION (tv): sum of |adjacent changes|.
      #|   Non-negative trivially; each step adds |d| >= 0.
      #|
      #| MAXIMUM CHANGE (max_ch): largest |change| seen so far.
      #|   Bounded variation: TV <= max_ch * (i-1) because each of the
      #|   (i-1) steps contributes at most max_ch. Preservation when
      #|   abs_d > max_ch: (abs_d - old_max_ch) * (i-1) >= 0.
      #|
      #| BAND TRACKING (sum, lo, hi): sum = xs[i-1] - xs[0] telescopes.
      #|   lo, hi track the minimum and maximum of all partial sums.
      #|   Triangle inequality: |d| >= d and |d| >= -d gives TV >= |sum|.
      #|   prefix_in_band: every xs[k]-xs[0] lies in [lo, hi].
      #|   Combined with TV >= hi-lo, this yields the all-pairs bound:
      #|     xs[i]-xs[j] = (xs[i]-xs[0]) - (xs[j]-xs[0]) <= hi - lo <= TV.
      #|
      #| SORTED CHECK (sorted): boolean accumulation.
      #|   adj_sorted_when_ok: if sorted=1, all adjacent pairs are <=.
      #|   Independent of the other analyses; verified by case split on d >= 0.
    ),
  }
}
