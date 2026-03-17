///|
/// Seventeen-dimensional Cauchy-Schwarz identity:
///   (||u||^2)(||v||^2) - (u.v)^2
/// = Sum_{i<j} (u_i v_j - u_j v_i)^2.
#ensures(cauchy17_ok(a, b, c, d, e, f, g, h, i, j, k, l, m, n, o, p, q, r, s, t, u, v, w, x, y, z, aa, ab, ac, ad, ae, af, ag, ah, result))
pub fn cauchy17_gap(
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
  ad : Int,
  ae : Int,
  af : Int,
  ag : Int,
  ah : Int,
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
    l * l +
    m * m +
    n * n +
    o * o +
    p * p +
    q * q
  ) *
  (
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
    ac * ac +
    ad * ad +
    ae * ae +
    af * af +
    ag * ag +
    ah * ah
  ) -
  (
    a * r +
    b * s +
    c * t +
    d * u +
    e * v +
    f * w +
    g * x +
    h * y +
    i * z +
    j * aa +
    k * ab +
    l * ac +
    m * ad +
    n * ae +
    o * af +
    p * ag +
    q * ah
  ) *
  (
    a * r +
    b * s +
    c * t +
    d * u +
    e * v +
    f * w +
    g * x +
    h * y +
    i * z +
    j * aa +
    k * ab +
    l * ac +
    m * ad +
    n * ae +
    o * af +
    p * ag +
    q * ah
  )
}
