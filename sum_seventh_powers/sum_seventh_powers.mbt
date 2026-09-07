///|
/// Sum of seventh powers:
///   Σ i^7 for i=0..n-1
///
/// To avoid division in the proof obligation, the postcondition is:
///   24 * result == n^2 (n-1)^2 (3n^4 - 6n^3 - n^2 + 4n + 2)
pub fn sum_seventh_powers(
  n : Int,
) -> Int where {
  proof_require: nonneg(n),
  proof_ensure: result => sum_seventh_powers_ok(n, result),
} {
  for i = 0, sum = 0; i < n; {
    let new_sum = sum + i * i * i * i * i * i * i
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
    (3 * i * i * i * i - 6 * i * i * i - i * i + 4 * i + 2),
  }
}
