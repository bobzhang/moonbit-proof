///|
/// Fibonacci prefix-sum identity:
///   Σ F(k) for k=0..n-1 = F(n+1) - 1
///
/// The function returns the proof gap `sum - F(n+1) + 1`, which must be 0.
///
/// Tracks `(a, b) = (F(i), F(i+1))` together with:
///   sum + 1 == b
pub fn fib_prefix_gap(
  n : Int,
) -> Int where {
  proof_require: nonneg(n),
  proof_ensure: result => fib_prefix_sum_ok(result),
} {
  for i = 0, a = 0, b = 1, sum = 0; i < n; {
    let new_sum = sum + a
    let new_a = b
    let new_b = a + b
    continue i + 1, new_a, new_b, new_sum
  } nobreak {
    sum - b + 1
  } where {
    proof_invariant: 0 <= i,
    proof_invariant: i <= n,
    proof_invariant: a >= 0,
    proof_invariant: b >= 1,
    proof_invariant: sum + 1 == b,
  }
}
