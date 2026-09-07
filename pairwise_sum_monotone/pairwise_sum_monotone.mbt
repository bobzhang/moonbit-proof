///|
/// Pointwise monotonicity of array sums:
///   if xs[i] <= ys[i] for all i, then Σ xs[i] <= Σ ys[i]
///
/// Returns `Σ ys[i] - Σ xs[i]`, proving the gap is non-negative.
pub fn pairwise_sum_gap(
  xs : FixedArray[Int],
  ys : FixedArray[Int],
) -> Int where {
  proof_require: same_length(xs, ys),
  proof_require: pointwise_le(xs, ys),
  proof_ensure: result => pairwise_sum_monotone_ok(result),
} {
  for i = 0, sumx = 0, sumy = 0; i < xs.length(); {
    let new_sumx = sumx + xs[i]
    let new_sumy = sumy + ys[i]
    continue i + 1, new_sumx, new_sumy
  } nobreak {
    sumy - sumx
  } where {
    proof_invariant: 0 <= i,
    proof_invariant: i <= xs.length(),
    proof_invariant: sumx <= sumy,
  }
}
