///|
/// Sum of squares: Σ i² for i=0..n-1 = n(n-1)(2n-1)/6
///
/// Tracks the classic cubic invariant:
///   6*sum == i*(i-1)*(2*i-1)
///
/// Preservation is a pure polynomial expansion after adding i².
#requires(nonneg(n))
#ensures(sum_squares_ok(n, result))
pub fn sum_squares(n : Int) -> Int {
  for i = 0, sum = 0; i < n; {
    let new_sum = sum + i * i
    continue i + 1, new_sum
  } nobreak {
    sum
  } where {
    invariant: 0 <= i,
    invariant: i <= n,
    invariant: 6 * sum == i * (i - 1) * (2 * i - 1),
  }
}
