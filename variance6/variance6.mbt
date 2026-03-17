///|
/// Six-point variance identity:
///   6 * Sum x_i^2 - (Sum x_i)^2 = Sum_{i<j} (x_i - x_j)^2.
///
/// This is the next fixed-dimension step after `variance5`.
#ensures(variance6_ok(a, b, c, d, e, f, result))
pub fn variance6_gap(
  a : Int,
  b : Int,
  c : Int,
  d : Int,
  e : Int,
  f : Int,
) -> Int {
  6 * (a * a + b * b + c * c + d * d + e * e + f * f) -
  (a + b + c + d + e + f) * (a + b + c + d + e + f)
}
