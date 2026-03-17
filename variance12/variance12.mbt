///|
/// Twelve-point variance identity:
///   12 * Sum x_i^2 - (Sum x_i)^2 = Sum_{i<j} (x_i - x_j)^2.
#ensures(variance12_ok(a, b, c, d, e, f, g, h, i, j, k, l, result))
pub fn variance12_gap(
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
  l : Int,
) -> Int {
  12 *
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
    k * k +
    l * l
  ) -
  (a + b + c + d + e + f + g + h + i + j + k + l) *
  (a + b + c + d + e + f + g + h + i + j + k + l)
}
