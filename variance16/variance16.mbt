///|
/// Sixteen-point variance identity:
///   16 * Sum x_i^2 - (Sum x_i)^2 = Sum_{i<j} (x_i - x_j)^2.
#ensures(variance16_ok(a, b, c, d, e, f, g, h, i, j, k, l, m, n, o, p, result))
pub fn variance16_gap(
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
  o : Int,
  p : Int,
) -> Int {
  16 *
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
    n * n +
    o * o +
    p * p
  ) -
  (a + b + c + d + e + f + g + h + i + j + k + l + m + n + o + p) *
  (a + b + c + d + e + f + g + h + i + j + k + l + m + n + o + p)
}
