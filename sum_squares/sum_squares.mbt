///|
/// Sum of squares: Σ i² for i=0..n-1 = n(n-1)(2n-1)/6
///
/// Tracks the classic cubic invariant:
///   6*sum == i*(i-1)*(2*i-1)
///
/// Preservation is a pure polynomial expansion after adding i².
pub fn sum_squares(
  n : Int,
) -> Int where {
  proof_require: nonneg(n),
  proof_ensure: result => sum_squares_ok(n, result),
} {
  for i = 0, sum = 0; i < n; {
    let new_sum = sum + i * i
    continue i + 1, new_sum
  } nobreak {
    sum
  } where {
    proof_invariant: 0 <= i,
    proof_invariant: i <= n,
    proof_invariant: 6 * sum == i * (i - 1) * (2 * i - 1),
  }
}
