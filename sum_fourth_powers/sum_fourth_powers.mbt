///|
/// Sum of fourth powers:
///   Σ i^4 for i=0..n-1
///
/// To avoid division in the proof obligation, the postcondition is:
///   30 * result == n(n-1)(2n-1)(3n^2-3n-1)
pub fn sum_fourth_powers(
  n : Int,
) -> Int where {
  proof_require: nonneg(n),
  proof_ensure: result => sum_fourth_powers_ok(n, result),
} {
  for i = 0, sum = 0; i < n; {
    let new_sum = sum + i * i * i * i
    continue i + 1, new_sum
  } nobreak {
    sum
  } where {
    proof_invariant: 0 <= i,
    proof_invariant: i <= n,
    proof_invariant: 30 * sum ==
    i * (i - 1) * (2 * i - 1) * (3 * i * i - 3 * i - 1),
  }
}
