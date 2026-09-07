///|
/// Sum of eleventh powers:
///   Σ i^11 for i=0..n-1
///
/// To avoid division in the proof obligation, the postcondition is:
///   24 * result == n^2 (n-1)^2 (2n^8 - 8n^7 + 4n^6 + 16n^5 - 5n^4 - 26n^3 - 3n^2 + 20n + 10)
pub fn sum_eleventh_powers(
  n : Int,
) -> Int where {
  proof_require: nonneg(n),
  proof_ensure: result => sum_eleventh_powers_ok(n, result),
} {
  for i = 0, sum = 0; i < n; {
    let new_sum = sum + i * i * i * i * i * i * i * i * i * i * i
    continue i + 1, new_sum
  } nobreak {
    sum
  } where {
    proof_invariant: 0 <= i,
    proof_invariant: i <= n,
    proof_invariant: 24 * sum ==
    i *
    i *
    (i - 1) *
    (i - 1) *
    (
      2 * i * i * i * i * i * i * i * i -
      8 * i * i * i * i * i * i * i +
      4 * i * i * i * i * i * i +
      16 * i * i * i * i * i -
      5 * i * i * i * i -
      26 * i * i * i -
      3 * i * i +
      20 * i +
      10
    ),
  }
}
