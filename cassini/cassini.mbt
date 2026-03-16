/// Cassini's Identity: fib(n)*fib(n+2) - fib(n+1)² = (-1)^(n+1)
///
/// One of the most beautiful identities in number theory. We track
/// a = fib(i), b = fib(i+1), and sign = (-1)^(i+1).
///
/// The key identity: fib(i)*fib(i+2) - fib(i+1)² = (-1)^(i+1).
/// Since fib(i+2) = fib(i) + fib(i+1) = a + b, this becomes:
///   a*(a+b) - b*b = a² + ab - b² = sign
///
/// Preservation proof:
///   After step: new_a = b, new_b = a + b, new_sign = -sign.
///   new_a² + new_a*new_b - new_b²
///   = b² + b*(a+b) - (a+b)²
///   = b² + ab + b² - a² - 2ab - b²
///   = b² - ab - a²
///   = -(a² + ab - b²)
///   = -sign = new_sign  ✓
#requires(nonneg(n))
#ensures(cassini_ok(result))
pub fn cassini(n : Int) -> Int {
  for i = 0, a = 0, b = 1, sign = -1; i < n; {
    let new_a = b
    let new_b = a + b
    let new_sign = -sign
    continue i + 1, new_a, new_b, new_sign
  } nobreak {
    a * a + a * b - b * b
  } where {
    invariant: 0 <= i,
    invariant: i <= n,
    invariant: a >= 0,
    invariant: b >= 1,
    invariant: sign == 1 || sign == -1,
    invariant: a * a + a * b - b * b == sign,
  }
}
