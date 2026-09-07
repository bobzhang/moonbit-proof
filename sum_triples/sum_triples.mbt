///|
/// Sum of consecutive triple products:
///   Σ i(i+1)(i+2) for i=0..n-1 = n(n-1)(n+1)(n+2)/4
///
/// The invariant is quartic but still SMT-friendly:
///   4*sum == i(i-1)(i+1)(i+2)
pub fn sum_triples(
  n : Int,
) -> Int where {
  proof_require: nonneg(n),
  proof_ensure: result => sum_triples_ok(n, result),
} {
  for i = 0, sum = 0; i < n; {
    let new_sum = sum + i * (i + 1) * (i + 2)
    continue i + 1, new_sum
  } nobreak {
    sum
  } where {
    proof_invariant: 0 <= i,
    proof_invariant: i <= n,
    proof_invariant: 4 * sum == i * (i - 1) * (i + 1) * (i + 2),
  }
}
