///|
/// Eleven-point variance identity:
///   11 * Sum x_i^2 - (Sum x_i)^2 = Sum_{i<j} (x_i - x_j)^2.
#ensures(variance11_ok(a, b, c, d, e, f, g, h, i, j, k, result))
pub fn variance11_gap(
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
  k : Int,
) -> Int {
  11 *
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
    j * j +
    k * k
  ) -
  (a + b + c + d + e + f + g + h + i + j + k) *
  (a + b + c + d + e + f + g + h + i + j + k)
}
