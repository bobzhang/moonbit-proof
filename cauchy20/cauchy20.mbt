///|
/// Twenty-dimensional Cauchy-Schwarz identity:
///   (||u||^2)(||v||^2) - (u.v)^2
/// = Sum_{i<j} (u_i v_j - u_j v_i)^2.
#ensures(cauchy20_ok(a, b, c, d, e, f, g, h, i, j, k, l, m, n, o, p, q, r, s, t, u, v, w, x, y, z, aa, ab, ac, ad, ae, af, ag, ah, ai, aj, ak, al, am, an, result))
pub fn cauchy20_gap(
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
  ai : Int,
  aj : Int,
  ak : Int,
  al : Int,
  am : Int,
  an : Int,
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
    q * q +
    r * r +
    s * s +
    t * t
  ) *
  (
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
    ah * ah +
    ai * ai +
    aj * aj +
    ak * ak +
    al * al +
    am * am +
    an * an
  ) -
  (
    a * u +
    b * v +
    c * w +
    d * x +
    e * y +
    f * z +
    g * aa +
    h * ab +
    i * ac +
    j * ad +
    k * ae +
    l * af +
    m * ag +
    n * ah +
    o * ai +
    p * aj +
    q * ak +
    r * al +
    s * am +
    t * an
  ) *
  (
    a * u +
    b * v +
    c * w +
    d * x +
    e * y +
    f * z +
    g * aa +
    h * ab +
    i * ac +
    j * ad +
    k * ae +
    l * af +
    m * ag +
    n * ah +
    o * ai +
    p * aj +
    q * ak +
    r * al +
    s * am +
    t * an
  )
}
