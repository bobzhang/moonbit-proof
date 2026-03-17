///|
/// Twelve-dimensional Cauchy-Schwarz identity:
///   (||u||^2)(||v||^2) - (u.v)^2
/// = Sum_{i<j} (u_i v_j - u_j v_i)^2.
#ensures(cauchy12_ok(a, b, c, d, e, f, g, h, i, j, k, l, p, q, r, s, t, u, v, w, x, y, z, aa, result))
pub fn cauchy12_gap(
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
) -> Int {
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
  ) *
  (
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
    aa * aa
  ) -
  (
    a * p +
    b * q +
    c * r +
    d * s +
    e * t +
    f * u +
    g * v +
    h * w +
    i * x +
    j * y +
    k * z +
    l * aa
  ) *
  (
    a * p +
    b * q +
    c * r +
    d * s +
    e * t +
    f * u +
    g * v +
    h * w +
    i * x +
    j * y +
    k * z +
    l * aa
  )
}
