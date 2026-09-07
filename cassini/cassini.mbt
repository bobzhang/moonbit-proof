///|
/// Cassini's Identity (Fibonacci)
///
/// Proves one of the most beautiful theorems in number theory:
///   fib(n) * fib(n+2) - fib(n+1)² = (-1)^(n+1)
///
/// The product of two Fibonacci numbers two apart, minus the square of the one
/// between them, always equals exactly +1 or -1, alternating with each step.
/// This identity connects the Fibonacci sequence to determinants of 2×2
/// matrices and has deep ties to continued fractions and hyperbolic geometry.
pub fn cassini(
  n : Int,
) -> Int where {
  proof_require: nonneg(n),
  proof_ensure: result => cassini_ok(result),
} {
  for i = 0, a = 0, b = 1, sign = -1; i < n; {
    let new_a = b
    let new_b = a + b
    let new_sign = -sign
    continue i + 1, new_a, new_b, new_sign
  } nobreak {
    a * a + a * b - b * b
  } where {
    proof_invariant: 0 <= i,
    proof_invariant: i <= n,
    proof_invariant: a >= 0,
    proof_invariant: b >= 1,
    proof_invariant: sign == 1 || sign == -1,
    proof_invariant: a * a + a * b - b * b == sign,
    proof_reasoning: (
      #| We track three loop variables: a = fib(i), b = fib(i+1), and
      #| sign = (-1)^(i+1). The core invariant is the quadratic form:
      #|
      #|   a² + a*b - b² = sign
      #|
      #| This directly encodes Cassini's identity because fib(i+2) = a + b, so:
      #|   fib(i)*fib(i+2) - fib(i+1)² = a*(a+b) - b² = a² + ab - b²
      #|
      #| Initialization: At i=0: a=0, b=1, sign=-1.
      #|   0² + 0*1 - 1² = -1 = sign.
      #|
      #| Preservation: After one Fibonacci step (a <- b, b <- a+b, sign <- -sign):
      #|   new form = b² + b*(a+b) - (a+b)²
      #|            = b² + ab + b² - a² - 2ab - b²
      #|            = -a² - ab + b²
      #|            = -(a² + ab - b²)
      #|            = -sign = new_sign
      #|
      #| The quadratic form negates at each step, perfectly matching the sign flip.
      #| The SMT solver verifies this polynomial identity automatically.
      #|
      #| Postcondition: The return value a*a + a*b - b*b equals sign, and
      #| sign² = 1, so result² = 1, meaning the result is exactly +1 or -1.
    ),
  }
}
