///|
/// Sum of eighth powers:
///   Σ i^8 for i=0..n-1
///
/// To avoid division in the proof obligation, the postcondition is:
///   90 * result == n(n-1)(2n-1)(5n^6 - 15n^5 + 5n^4 + 15n^3 - n^2 - 9n - 3)
pub fn sum_eighth_powers(
  n : Int,
) -> Int where {
  proof_require: nonneg(n),
  proof_ensure: result => sum_eighth_powers_ok(n, result),
} {
  for i = 0, sum = 0; i < n; {
    let new_sum = sum + i * i * i * i * i * i * i * i
    continue i + 1, new_sum
  } nobreak {
    sum
  } where {
    proof_invariant: 0 <= i,
    proof_invariant: i <= n,
    proof_invariant: 90 * sum ==
    i *
    (i - 1) *
    (2 * i - 1) *
    (
      5 * i * i * i * i * i * i -
      15 * i * i * i * i * i +
      5 * i * i * i * i +
      15 * i * i * i -
      i * i -
      9 * i -
      3
    ),
  }
}
