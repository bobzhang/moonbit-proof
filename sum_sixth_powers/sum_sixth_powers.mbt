///|
/// Sum of sixth powers:
///   Σ i^6 for i=0..n-1
///
/// To avoid division in the proof obligation, the postcondition is:
///   42 * result == n(n-1)(2n-1)(3n^4 - 6n^3 + 3n + 1)
#requires(nonneg(n))
#ensures(sum_sixth_powers_ok(n, result))
pub fn sum_sixth_powers(n : Int) -> Int {
  for i = 0, sum = 0; i < n; {
    let new_sum = sum + i * i * i * i * i * i
    continue i + 1, new_sum
  } nobreak {
    sum
  } where {
    invariant: 0 <= i,
    invariant: i <= n,
    invariant: 42 * sum ==
    i * (i - 1) * (2 * i - 1) * (3 * i * i * i * i - 6 * i * i * i + 3 * i + 1),
  }
}
