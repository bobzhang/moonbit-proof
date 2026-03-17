///|
/// Sum of tenth powers:
///   Σ i^10 for i=0..n-1
///
/// To avoid division in the proof obligation, the postcondition is:
///   66 * result == n(n-1)(2n-1)(3n^8 - 12n^7 + 8n^6 + 18n^5 - 10n^4 - 24n^3 + 2n^2 + 15n + 5)
#requires(nonneg(n))
#ensures(sum_tenth_powers_ok(n, result))
pub fn sum_tenth_powers(n : Int) -> Int {
  for i = 0, sum = 0; i < n; {
    let new_sum = sum + i * i * i * i * i * i * i * i * i * i
    continue i + 1, new_sum
  } nobreak {
    sum
  } where {
    invariant: 0 <= i,
    invariant: i <= n,
    invariant: 66 * sum ==
    i *
    (i - 1) *
    (2 * i - 1) *
    (
      3 * i * i * i * i * i * i * i * i -
      12 * i * i * i * i * i * i * i +
      8 * i * i * i * i * i * i +
      18 * i * i * i * i * i -
      10 * i * i * i * i -
      24 * i * i * i +
      2 * i * i +
      15 * i +
      5
    ),
  }
}
