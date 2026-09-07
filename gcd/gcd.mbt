///|
/// Extended Euclidean Algorithm with Bezout's Identity
///
/// Computes gcd(a, b) using the Euclidean algorithm while simultaneously
/// tracking Bezout coefficients x, y such that a*x + b*y = gcd(a, b).
///
/// Bezout's identity is the algebraic foundation of:
///   - RSA cryptography (modular multiplicative inverses)
///   - Error-correcting codes (syndrome decoding)
///   - Diophantine equations (integer solutions to a*x + b*y = c)
///
/// The proof tracks SEVEN state variables through the Euclidean reduction,
/// maintaining two simultaneous Bezout relations as polynomial invariants:
///   a * x0 + b * y0 = r0
///   a * x1 + b * y1 = r1
///
/// At exit, r1 = 0 and r0 = gcd(a, b), so the first relation gives
/// the classical Bezout identity: a * x0 + b * y0 = gcd(a, b).
pub fn gcd(
  a : Int,
  b : Int,
) -> Int where {
  proof_require: pos2(a, b),
  proof_ensure: result => gcd_pos(result),
} {
  for step = 0, r0 = a, r1 = b, x0 = 1, y0 = 0, x1 = 0, y1 = 1; step < b + 1; {
    if r1 == 0 {
      // ── GCD found: exit by jumping step to bound ──────────────
      continue b + 1, r0, 0, x0, y0, x1, y1
    } else {
      // ── Euclidean reduction: r0, r1 ← r1, r0 mod r1 ──────────
      let q = r0 / r1
      let new_r0 = r1
      let new_r1 = r0 - q * r1

      // ── Update Bezout coefficients ────────────────────────────
      let new_x0 = x1
      let new_y0 = y1
      let new_x1 = x0 - q * x1
      let new_y1 = y0 - q * y1

      continue step + 1, new_r0, new_r1, new_x0, new_y0, new_x1, new_y1
    }
  } nobreak {
    r0
  } where {
    // ── Step counter ────────────────────────────────────────────
    proof_invariant: 0 <= step,

    // ── Remainder bounds ────────────────────────────────────────
    proof_invariant: r0 >= 1,
    proof_invariant: r1 >= 0,

    // ── Bezout's identity for r0: a*x0 + b*y0 = r0 ─────────────
    proof_invariant: a * x0 + b * y0 == r0,

    // ── Bezout's identity for r1: a*x1 + b*y1 = r1 ─────────────
    proof_invariant: a * x1 + b * y1 == r1,

    // ── Termination bound: r1 strictly decreases each step ──────
    proof_invariant: r1 == 0 || r1 + step <= b,
    proof_reasoning: (
      #| Seven state variables: step counter, two remainders (r0, r1),
      #| and four Bezout coefficients (x0, y0, x1, y1).
      #|
      #| BEZOUT PRESERVATION is the heart of the proof. At each Euclidean
      #| step with quotient q = r0 / r1:
      #|
      #|   New Bezout for r0': r0' = r1, x0' = x1, y0' = y1.
      #|     a*x0' + b*y0' = a*x1 + b*y1 = r1 = r0'. (by old Bezout for r1)
      #|
      #|   New Bezout for r1': r1' = r0 - q*r1, x1' = x0 - q*x1, y1' = y0 - q*y1.
      #|     a*x1' + b*y1' = a*(x0 - q*x1) + b*(y0 - q*y1)
      #|                    = (a*x0 + b*y0) - q*(a*x1 + b*y1)
      #|                    = r0 - q*r1 = r1'. (by both old Bezout relations)
      #|
      #| TERMINATION: r1' = r0 mod r1 < r1 (property of integer division).
      #|   So r1 strictly decreases, bounded by r1 + step <= b.
      #|
      #| At exit: r1 = 0, giving a*x0 + b*y0 = r0 = gcd(a, b).
      #| This is Bezout's identity, the foundation of modular arithmetic.
    ),
  }
}
