///|
/// Sum of odd squares:
///   Σ (2i+1)² for i=0..n-1 = n(2n-1)(2n+1)/3
///
/// The proof uses the cubic invariant:
///   3*sum == i*(2*i-1)*(2*i+1)
#requires(nonneg(n))
#ensures(odd_squares_ok(n, result))
pub fn odd_squares(n : Int) -> Int {
  for i = 0, sum = 0; i < n; {
    let term = 2 * i + 1
    let new_sum = sum + term * term
    continue i + 1, new_sum
  } nobreak {
    sum
  } where {
    invariant: 0 <= i,
    invariant: i <= n,
    invariant: 3 * sum == i * (2 * i - 1) * (2 * i + 1),
  }
}
