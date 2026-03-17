///|
/// Lucas analogue of Cassini's identity:
///   L(n)L(n+2) - L(n+1)^2 = 5 * (-1)^n
///
/// With `a = L(i)` and `b = L(i+1)`, the invariant is:
///   a^2 + a*b - b^2 == 5 * sign
///
/// The Fibonacci/Lucas recurrence step `(a, b) -> (b, a + b)` negates the
/// quadratic form, so the result always has square 25.
#requires(nonneg(n))
#ensures(lucas_cassini_ok(result))
pub fn lucas_cassini(n : Int) -> Int {
  for i = 0, a = 2, b = 1, sign = 1; i < n; {
    let new_a = b
    let new_b = a + b
    let new_sign = -sign
    continue i + 1, new_a, new_b, new_sign
  } nobreak {
    a * a + a * b - b * b
  } where {
    invariant: 0 <= i,
    invariant: i <= n,
    invariant: a >= 1,
    invariant: b >= 1,
    invariant: sign == 1 || sign == -1,
    invariant: a * a + a * b - b * b == 5 * sign,
  }
}
