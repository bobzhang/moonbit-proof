///|
/// Ten-point variance identity:
///   10 * Sum x_i^2 - (Sum x_i)^2 = Sum_{i<j} (x_i - x_j)^2.
#ensures(variance10_ok(a, b, c, d, e, f, g, h, i, j, result))
pub fn variance10_gap(
  a : Int,
  b : Int,
  c : Int,
  d : Int,
  e : Int,
  f : Int,
  g : Int,
  h : Int,
  i : Int,
  j : Int,
) -> Int {
  10 *
  (
    a * a +
    b * b +
    c * c +
    d * d +
    e * e +
    f * f +
    g * g +
    h * h +
    i * i +
    j * j
  ) -
  (a + b + c + d + e + f + g + h + i + j) *
  (a + b + c + d + e + f + g + h + i + j)
}
