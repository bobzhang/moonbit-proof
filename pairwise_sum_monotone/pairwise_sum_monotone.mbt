///|
/// Pointwise monotonicity of array sums:
///   if xs[i] <= ys[i] for all i, then Σ xs[i] <= Σ ys[i]
///
/// Returns `Σ ys[i] - Σ xs[i]`, proving the gap is non-negative.
#requires(same_length(xs, ys))
#requires(pointwise_le(xs, ys))
#ensures(pairwise_sum_monotone_ok(result))
pub fn pairwise_sum_gap(xs : FixedArray[Int], ys : FixedArray[Int]) -> Int {
  for i = 0, sumx = 0, sumy = 0; i < xs.length(); {
    let new_sumx = sumx + xs[i]
    let new_sumy = sumy + ys[i]
    continue i + 1, new_sumx, new_sumy
  } nobreak {
    sumy - sumx
  } where {
    invariant: 0 <= i,
    invariant: i <= xs.length(),
    invariant: sumx <= sumy,
  }
}
