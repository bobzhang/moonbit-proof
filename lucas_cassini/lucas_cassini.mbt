///|
/// Lucas analogue of Cassini's identity:
///   L(n)L(n+2) - L(n+1)^2 = 5 * (-1)^n
///
/// With `a = L(i)` and `b = L(i+1)`, the invariant is:
///   a^2 + a*b - b^2 == 5 * sign
///
/// The Fibonacci/Lucas recurrence step `(a, b) -> (b, a + b)` negates the
/// quadratic form, so the result always has square 25.
pub fn lucas_cassini(
  n : Int,
) -> Int where {
  proof_require: nonneg(n),
  proof_ensure: result => lucas_cassini_ok(result),
} {
  for i = 0, a = 2, b = 1, sign = 1; i < n; {
    let new_a = b
    let new_b = a + b
    let new_sign = -sign
    continue i + 1, new_a, new_b, new_sign
  } nobreak {
    a * a + a * b - b * b
  } where {
    proof_invariant: 0 <= i,
    proof_invariant: i <= n,
    proof_invariant: a >= 1,
    proof_invariant: b >= 1,
    proof_invariant: sign == 1 || sign == -1,
    proof_invariant: a * a + a * b - b * b == 5 * sign,
  }
}
