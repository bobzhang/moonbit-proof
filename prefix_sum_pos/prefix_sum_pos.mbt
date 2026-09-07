///|
/// Sum of positive elements dominates every element
///
/// Proves: if all xs[i] > 0, then sum >= xs[k] for all k
///
/// When all elements are strictly positive, the total sum is at least
/// as large as any single element. Quantified invariant sum_geq_each
/// maintained because: new_sum = sum + xs[i] >= sum >= xs[k] for old k,
/// and new_sum >= xs[i] since sum >= 0.
pub fn sum_positive(
  xs : FixedArray[Int],
) -> Int where {
  proof_require: nonempty(xs),
  proof_require: all_positive(xs),
  proof_ensure: result => prefix_sum_pos_ok(xs, result),
} {
  for i = 0, sum = 0; i < xs.length(); {
    let new_sum = sum + xs[i]
    continue i + 1, new_sum
  } nobreak {
    sum
  } where {
    proof_invariant: 0 <= i,
    proof_invariant: i <= xs.length(),
    proof_invariant: sum >= 0,
    proof_invariant: sum_geq_each(xs, sum, i),
  }
}
