///|
/// Fourteen-point variance identity:
///   14 * Sum x_i^2 - (Sum x_i)^2 = Sum_{i<j} (x_i - x_j)^2.
#ensures(variance14_ok(a, b, c, d, e, f, g, h, i, j, k, l, m, n, result))
pub fn variance14_gap(
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
  m : Int,
  n : Int,
) -> Int {
  14 *
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
    l * l +
    m * m +
    n * n
  ) -
  (a + b + c + d + e + f + g + h + i + j + k + l + m + n) *
  (a + b + c + d + e + f + g + h + i + j + k + l + m + n)
}
