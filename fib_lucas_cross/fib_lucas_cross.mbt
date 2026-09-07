///|
/// Fibonacci-Lucas Cross Identity
///
/// Simultaneously tracks Fibonacci numbers (a, b) and Lucas numbers (c, d)
/// through their shared recurrence, proving THREE interacting quadratic
/// form invariants:
///
///   1. c² - 5a² = 4·sign        (Fibonacci-Lucas Cassini)
///   2. c² + d² = 5·(a² + b²)    (norm identity)
///   3. cd - 5ab = 2·sign         (cross-product identity)
///
/// These are NOT independent: proving preservation of EACH invariant requires
/// the SMT solver to USE the other two. Specifically:
///   - Invariant 1 preservation uses invariant 2 (to derive d²-5b² = -4·sign)
///   - Invariant 2 preservation uses invariants 1 AND 3 (to cancel cross terms)
///   - Invariant 3 preservation uses the derived relation from 1+2
///
/// This is the most challenging single proof in the repository: three
/// COUPLED quadratic forms where the solver must perform multi-step
/// polynomial algebra across all hypotheses simultaneously.
///
/// The identity c² - 5a² = 4·(-1)^n connects to the Pell equation
/// x² - 5y² = ±4, whose solutions are exactly the Lucas-Fibonacci pairs.
/// This is the algebraic foundation of the golden ratio's number theory.
pub fn fib_lucas(
  n : Int,
) -> Int where {
  proof_require: nonneg(n),
  proof_ensure: result => fib_lucas_ok(result),
} {
  for i = 0, a = 0, b = 1, c = 2, d = 1, sign = 1; i < n; {
    // ── Fibonacci step: F(i), F(i+1) → F(i+1), F(i+2) ─────────
    let new_a = b
    let new_b = a + b

    // ── Lucas step: L(i), L(i+1) → L(i+1), L(i+2) ─────────────
    let new_c = d
    let new_d = c + d

    // ── Sign alternation ────────────────────────────────────────
    let new_sign = -sign

    continue i + 1, new_a, new_b, new_c, new_d, new_sign
  } nobreak {
    c * c - 5 * a * a
  } where {
    proof_invariant: 0 <= i,
    proof_invariant: i <= n,

    // ── Sign tracking ───────────────────────────────────────────
    proof_invariant: sign == 1 || sign == -1,

    // ── INVARIANT 1: Fibonacci-Lucas Cassini identity ───────────
    // L(n)² - 5·F(n)² = 4·(-1)^n
    proof_invariant: c * c - 5 * a * a == 4 * sign,

    // ── INVARIANT 2: Norm identity ──────────────────────────────
    // L(n)² + L(n+1)² = 5·(F(n)² + F(n+1)²)
    proof_invariant: c * c + d * d == 5 * a * a + 5 * b * b,

    // ── INVARIANT 3: Cross-product identity ─────────────────────
    // L(n)·L(n+1) - 5·F(n)·F(n+1) = 2·(-1)^n
    proof_invariant: c * d - 5 * a * b == 2 * sign,
    proof_reasoning: (
      #| Three quadratic form invariants that INTERACT during preservation:
      #|
      #| INVARIANT 1 PRESERVATION: need d²-5b² = -4·sign.
      #|   From inv2: d² = 5a²+5b²-c². So d²-5b² = 5a²-c² = -(c²-5a²) = -4·sign.
      #|   (Uses invariant 2 to express d² in terms of other variables,
      #|    then invariant 1 to evaluate c²-5a².)
      #|
      #| INVARIANT 2 PRESERVATION: need d²+(c+d)² = 5(b²+(a+b)²).
      #|   Expand: c²+2d²+2cd = 5a²+10ab+10b².
      #|   Using inv2: c²+d² = 5a²+5b², so need d²+2cd = 5b²+10ab.
      #|   I.e., (d²-5b²) + 2(cd-5ab) = 0.
      #|   From derived: d²-5b² = -4·sign. From inv3: cd-5ab = 2·sign.
      #|   So: -4·sign + 2·(2·sign) = -4·sign + 4·sign = 0. ✓
      #|   (Uses ALL THREE invariants!)
      #|
      #| INVARIANT 3 PRESERVATION: need d(c+d)-5b(a+b) = -2·sign.
      #|   Expand: cd+d²-5ab-5b² = (cd-5ab)+(d²-5b²) = 2·sign+(-4·sign) = -2·sign. ✓
      #|   (Uses invariant 3 and the derived relation from invariants 1+2.)
    ),
  }
}
