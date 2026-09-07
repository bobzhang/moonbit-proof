///|
/// Sum of odd cubes:
///   Σ (2i+1)³ for i=0..n-1 = n²(2n²-1)
///
/// Invariant:
///   sum == i²(2i²-1)
pub fn odd_cubes(
  n : Int,
) -> Int where {
  proof_require: nonneg(n),
  proof_ensure: result => odd_cubes_ok(n, result),
} {
  for i = 0, sum = 0; i < n; {
    let term = 2 * i + 1
    let new_sum = sum + term * term * term
    continue i + 1, new_sum
  } nobreak {
    sum
  } where {
    proof_invariant: 0 <= i,
    proof_invariant: i <= n,
    proof_invariant: sum == i * i * (2 * i * i - 1),
  }
}
