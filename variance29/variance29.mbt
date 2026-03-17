///|
/// 29-point variance identity:
///   29 * Sum x_i^2 - (Sum x_i)^2 = Sum_{i<j} (x_i - x_j)^2.
#ensures(variance29_ok(a, b, c, d, e, f, g, h, i, j, k, l, m, n, o, p, q, r, s, t, u, v, w, x, y, z, aa, ab, ac, result))
pub fn variance29_gap(
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
  t : Int,
  u : Int,
  v : Int,
  w : Int,
  x : Int,
  y : Int,
  z : Int,
  aa : Int,
  ab : Int,
  ac : Int,
) -> Int {
  29 *
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
    s * s +
    t * t +
    u * u +
    v * v +
    w * w +
    x * x +
    y * y +
    z * z +
    aa * aa +
    ab * ab +
    ac * ac
  ) -
  (
    a +
    b +
    c +
    d +
    e +
    f +
    g +
    h +
    i +
    j +
    k +
    l +
    m +
    n +
    o +
    p +
    q +
    r +
    s +
    t +
    u +
    v +
    w +
    x +
    y +
    z +
    aa +
    ab +
    ac
  ) *
  (
    a +
    b +
    c +
    d +
    e +
    f +
    g +
    h +
    i +
    j +
    k +
    l +
    m +
    n +
    o +
    p +
    q +
    r +
    s +
    t +
    u +
    v +
    w +
    x +
    y +
    z +
    aa +
    ab +
    ac
  )
}
