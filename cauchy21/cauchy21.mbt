///|
/// Twenty-one-dimensional Cauchy-Schwarz identity:
///   (||u||^2)(||v||^2) - (u.v)^2
/// = Sum_{i<j} (u_i v_j - u_j v_i)^2.
#ensures(cauchy21_ok(a, b, c, d, e, f, g, h, i, j, k, l, m, n, o, p, q, r, s, t, u, v, w, x, y, z, aa, ab, ac, ad, ae, af, ag, ah, ai, aj, ak, al, am, an, ao, ap, result))
pub fn cauchy21_gap(
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
  ao : Int,
  ap : Int,
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
    t * t +
    u * u
  ) *
  (
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
    an * an +
    ao * ao +
    ap * ap
  ) -
  (
    a * v +
    b * w +
    c * x +
    d * y +
    e * z +
    f * aa +
    g * ab +
    h * ac +
    i * ad +
    j * ae +
    k * af +
    l * ag +
    m * ah +
    n * ai +
    o * aj +
    p * ak +
    q * al +
    r * am +
    s * an +
    t * ao +
    u * ap
  ) *
  (
    a * v +
    b * w +
    c * x +
    d * y +
    e * z +
    f * aa +
    g * ab +
    h * ac +
    i * ad +
    j * ae +
    k * af +
    l * ag +
    m * ah +
    n * ai +
    o * aj +
    p * ak +
    q * al +
    r * am +
    s * an +
    t * ao +
    u * ap
  )
}
