///|
/// Sum of first n even numbers: 2+4+6+...+2n = n*(n+1)
///
/// Invariant: sum == i*(i+1).
/// Preservation: sum + 2*(i+1) = i*(i+1) + 2*(i+1) = (i+1)*(i+2)  ✓
pub fn sum_even(
  n : Int,
) -> Int where {
  proof_require: nonneg(n),
  proof_ensure: result => sumeven_ok(n, result),
} {
  for i = 0, sum = 0; i < n; {
    let new_sum = sum + 2 * (i + 1)
    continue i + 1, new_sum
  } nobreak {
    sum
  } where {
    proof_invariant: 0 <= i,
    proof_invariant: i <= n,
    proof_invariant: sum == i * (i + 1),
  }
}
