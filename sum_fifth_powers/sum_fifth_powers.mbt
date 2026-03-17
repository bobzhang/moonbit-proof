///|
/// Sum of fifth powers:
///   Σ i^5 for i=0..n-1
///
/// To avoid division in the proof obligation, the postcondition is:
///   12 * result == n^2 (n-1)^2 (2n^2-2n-1)
#requires(nonneg(n))
#ensures(sum_fifth_powers_ok(n, result))
pub fn sum_fifth_powers(n : Int) -> Int {
  for i = 0, sum = 0; i < n; {
    let new_sum = sum + i * i * i * i * i
    continue i + 1, new_sum
  } nobreak {
    sum
  } where {
    invariant: 0 <= i,
    invariant: i <= n,
    invariant: 12 * sum == i * i * (i - 1) * (i - 1) * (2 * i * i - 2 * i - 1),
  }
}
