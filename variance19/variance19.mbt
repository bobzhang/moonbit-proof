///|
/// Nineteen-point variance identity:
///   19 * Sum x_i^2 - (Sum x_i)^2 = Sum_{i<j} (x_i - x_j)^2.
#ensures(variance19_ok(a, b, c, d, e, f, g, h, i, j, k, l, m, n, o, p, q, r, s, result))
pub fn variance19_gap(
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
  q : Int,
  r : Int,
  s : Int,
) -> Int {
  19 *
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
    p * p +
    q * q +
    r * r +
    s * s
  ) -
  (a + b + c + d + e + f + g + h + i + j + k + l + m + n + o + p + q + r + s) *
  (a + b + c + d + e + f + g + h + i + j + k + l + m + n + o + p + q + r + s)
}
