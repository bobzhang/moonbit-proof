///|
/// Eight-point variance identity:
///   8 * Sum x_i^2 - (Sum x_i)^2 = Sum_{i<j} (x_i - x_j)^2.
#ensures(variance8_ok(a, b, c, d, e, f, g, h, result))
pub fn variance8_gap(
  a : Int,
  b : Int,
  c : Int,
  d : Int,
  e : Int,
  f : Int,
  g : Int,
  h : Int,
) -> Int {
  8 * (a * a + b * b + c * c + d * d + e * e + f * f + g * g + h * h) -
  (a + b + c + d + e + f + g + h) * (a + b + c + d + e + f + g + h)
}
