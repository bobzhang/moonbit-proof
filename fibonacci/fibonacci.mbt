///|
/// Fibonacci numbers are non-negative: fib(n) >= 0
///
/// Two accumulators (a, b) = (fib(i), fib(i+1)).
/// Invariant: a >= 0, b >= 1.
/// Preservation: new_a = b >= 1 >= 0, new_b = a + b >= 0 + 1 = 1.
/// Uses let bindings to avoid sequential assignment bug.
pub fn fib(
  n : Int,
) -> Int where {
  proof_require: nonneg(n),
  proof_ensure: result => fib_ok(result),
} {
  for i = 0, a = 0, b = 1; i < n; {
    let new_a = b
    let new_b = a + b
    continue i + 1, new_a, new_b
  } nobreak {
    a
  } where {
    proof_invariant: 0 <= i,
    proof_invariant: i <= n,
    proof_invariant: a >= 0,
    proof_invariant: b >= 1,
  }
}
