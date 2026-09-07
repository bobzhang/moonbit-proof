///|
/// Sum of cubes:
///   Σ i³ for i=0..n-1 = (n(n-1)/2)²
///
/// To avoid division in the proof obligation, the postcondition is:
///   4*result == n²(n-1)²
///
/// Invariant:
///   4*sum == i²(i-1)²
pub fn sum_cubes(
  n : Int,
) -> Int where {
  proof_require: nonneg(n),
  proof_ensure: result => sum_cubes_ok(n, result),
} {
  for i = 0, sum = 0; i < n; {
    let new_sum = sum + i * i * i
    continue i + 1, new_sum
  } nobreak {
    sum
  } where {
    proof_invariant: 0 <= i,
    proof_invariant: i <= n,
    proof_invariant: 4 * sum == i * i * (i - 1) * (i - 1),
  }
}
