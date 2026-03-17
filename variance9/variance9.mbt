///|
/// Nine-point variance identity:
///   9 * Sum x_i^2 - (Sum x_i)^2 = Sum_{i<j} (x_i - x_j)^2.
#ensures(variance9_ok(a, b, c, d, e, f, g, h, i, result))
pub fn variance9_gap(
  a : Int,
  b : Int,
  c : Int,
  d : Int,
  e : Int,
  f : Int,
  g : Int,
  h : Int,
  i : Int,
) -> Int {
  9 * (a * a + b * b + c * c + d * d + e * e + f * f + g * g + h * h + i * i) -
  (a + b + c + d + e + f + g + h + i) * (a + b + c + d + e + f + g + h + i)
}
