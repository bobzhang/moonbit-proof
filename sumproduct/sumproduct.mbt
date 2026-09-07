///|
/// Sum of consecutive products: Σ i*(i+1) for i=0..n-1 = n*(n-1)*(n+1)/3
///
/// Proves: 3*result == n*(n-1)*(n+1)
///
/// Invariant: 3*sum == i*(i-1)*(i+1). Preservation:
///   3*(sum + i*(i+1)) = i*(i-1)*(i+1) + 3*i*(i+1)
///                     = i*(i+1)*[(i-1) + 3]
///                     = i*(i+1)*(i+2)
///                     = (i+1)*i*(i+2)     ✓ matches invariant at i+1
pub fn sum_product(
  n : Int,
) -> Int where {
  proof_require: nonneg(n),
  proof_ensure: result => sumproduct_ok(n, result),
} {
  for i = 0, sum = 0; i < n; {
    let new_sum = sum + i * (i + 1)
    continue i + 1, new_sum
  } nobreak {
    sum
  } where {
    proof_invariant: 0 <= i,
    proof_invariant: i <= n,
    proof_invariant: 3 * sum == i * (i - 1) * (i + 1),
  }
}
