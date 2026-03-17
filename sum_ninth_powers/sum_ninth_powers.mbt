///|
/// Sum of ninth powers:
///   Σ i^9 for i=0..n-1
///
/// To avoid division in the proof obligation, the postcondition is:
///   20 * result == n^2 (n-1)^2 (2n^6 - 6n^5 + n^4 + 8n^3 + n^2 - 6n - 3)
#requires(nonneg(n))
#ensures(sum_ninth_powers_ok(n, result))
pub fn sum_ninth_powers(n : Int) -> Int {
  for i = 0, sum = 0; i < n; {
    let new_sum = sum + i * i * i * i * i * i * i * i * i
    continue i + 1, new_sum
  } nobreak {
    sum
  } where {
    invariant: 0 <= i,
    invariant: i <= n,
    invariant: 20 * sum ==
    i *
    i *
    (i - 1) *
    (i - 1) *
    (
      2 * i * i * i * i * i * i -
      6 * i * i * i * i * i +
      i * i * i * i +
      8 * i * i * i +
      i * i -
      6 * i -
      3
    ),
  }
}
