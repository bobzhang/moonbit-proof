///|
/// Total variation >= |xs[n-1] - xs[0]| (triangle inequality for sequences)
///
/// Proves: Σ|xs[i+1]-xs[i]| >= xs[n-1]-xs[0] AND >= xs[0]-xs[n-1]
///
/// Combines THREE invariant techniques in ONE proof:
///   1. tv >= 0 (sum of non-negatives)
///   2. sum == xs[i] - xs[0] (telescoping, array-valued)
///   3. tv >= sum AND tv >= -sum (triangle inequality)
///
/// Preservation uses |d| >= d and |d| >= -d for d = xs[i+1]-xs[i].
pub fn total_var(
  xs : FixedArray[Int],
) -> Int where {
  proof_require: has_two(xs),
  proof_ensure: result => tv_ok(xs, result),
} {
  for i = 0, tv = 0, sum = 0; i < xs.length() - 1; {
    let d = xs[i + 1] - xs[i]
    let abs_d = if d >= 0 { d } else { -d }
    let new_tv = tv + abs_d
    let new_sum = sum + d
    continue i + 1, new_tv, new_sum
  } nobreak {
    tv
  } where {
    proof_invariant: 0 <= i,
    proof_invariant: i <= xs.length() - 1,
    proof_invariant: tv >= 0,
    proof_invariant: sum == xs[i] - xs[0],
    proof_invariant: tv >= sum,
    proof_invariant: tv >= -sum,
  }
}
