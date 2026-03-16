/// Sum of positive elements dominates every element
///
/// Proves: if all xs[i] > 0, then sum >= xs[k] for all k
///
/// When all elements are strictly positive, the total sum is at least
/// as large as any single element. Quantified invariant sum_geq_each
/// maintained because: new_sum = sum + xs[i] >= sum >= xs[k] for old k,
/// and new_sum >= xs[i] since sum >= 0.
#requires(nonempty(xs))
#requires(all_positive(xs))
#ensures(prefix_sum_pos_ok(xs, result))
pub fn sum_positive(xs : FixedArray[Int]) -> Int {
  for i = 0, sum = 0; i < xs.length(); {
    let new_sum = sum + xs[i]
    continue i + 1, new_sum
  } nobreak {
    sum
  } where {
    invariant: 0 <= i,
    invariant: i <= xs.length(),
    invariant: sum >= 0,
    invariant: sum_geq_each(xs, sum, i),
  }
}
