///|
/// Sum of ninth powers:
///   Σ i^9 for i=0..n-1
///
/// To avoid division in the proof obligation, the postcondition is:
///   20 * result == n^2 (n-1)^2 (2n^6 - 6n^5 + n^4 + 8n^3 + n^2 - 6n - 3)
pub fn sum_ninth_powers(
  n : Int,
) -> Int where {
  proof_require: nonneg(n),
  proof_ensure: result => sum_ninth_powers_ok(n, result),
} {
  for i = 0, sum = 0; i < n; {
    let new_sum = sum + i * i * i * i * i * i * i * i * i
    continue i + 1, new_sum
  } nobreak {
    sum
  } where {
    proof_invariant: 0 <= i,
    proof_invariant: i <= n,
    proof_invariant: 20 * sum ==
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
