///|
/// Seven-point variance identity:
///   7 * Sum x_i^2 - (Sum x_i)^2 = Sum_{i<j} (x_i - x_j)^2.
#ensures(variance7_ok(a, b, c, d, e, f, g, result))
pub fn variance7_gap(
  a : Int,
  b : Int,
  c : Int,
  d : Int,
  e : Int,
  f : Int,
  g : Int,
) -> Int {
  7 * (a * a + b * b + c * c + d * d + e * e + f * f + g * g) -
  (a + b + c + d + e + f + g) * (a + b + c + d + e + f + g)
}
