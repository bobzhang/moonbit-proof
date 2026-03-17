///|
/// Eleven-dimensional Cauchy-Schwarz identity:
///   (||u||^2)(||v||^2) - (u.v)^2
/// = Sum_{i<j} (u_i v_j - u_j v_i)^2.
#ensures(cauchy11_ok(a, b, c, d, e, f, g, h, i, j, k, p, q, r, s, t, u, v, w, x, y, z, result))
pub fn cauchy11_gap(
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
    k * k
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
    z * z
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
    k * z
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
    k * z
  )
}
