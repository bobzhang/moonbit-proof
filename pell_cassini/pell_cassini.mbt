///|
/// Pell analogue of Cassini's identity:
///   P(n)P(n+2) - P(n+1)² = (-1)^(n+1)
///
/// With `a = P(i)` and `b = P(i+1)`, the invariant is:
///   a² + 2ab - b² == sign
///
/// After one Pell step `(a, b) -> (b, a + 2b)`, the expression negates.
pub fn pell_cassini(
  n : Int,
) -> Int where {
  proof_require: nonneg(n),
  proof_ensure: result => pell_cassini_ok(result),
} {
  for i = 0, a = 0, b = 1, sign = -1; i < n; {
    let new_a = b
    let new_b = a + 2 * b
    let new_sign = -sign
    continue i + 1, new_a, new_b, new_sign
  } nobreak {
    a * a + 2 * a * b - b * b
  } where {
    proof_invariant: 0 <= i,
    proof_invariant: i <= n,
    proof_invariant: a >= 0,
    proof_invariant: b >= 1,
    proof_invariant: sign == 1 || sign == -1,
    proof_invariant: a * a + 2 * a * b - b * b == sign,
  }
}
