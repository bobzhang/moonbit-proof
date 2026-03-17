///|
/// Twenty-five-dimensional Cauchy-Schwarz identity:
///   (||u||^2)(||v||^2) - (u.v)^2
/// = Sum_{i<j} (u_i v_j - u_j v_i)^2.
#ensures(cauchy25_ok(a, b, c, d, e, f, g, h, i, j, k, l, m, n, o, p, q, r, s, t, u, v, w, x, y, z, aa, ab, ac, ad, ae, af, ag, ah, ai, aj, ak, al, am, an, ao, ap, aq, ar, ba, bb, bc, bd, be, bf, result))
pub fn cauchy25_gap(
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
  aq : Int,
  ar : Int,
  ba : Int,
  bb : Int,
  bc : Int,
  bd : Int,
  be : Int,
  bf : Int,
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
    u * u +
    v * v +
    w * w +
    x * x +
    y * y
  ) *
  (
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
    ap * ap +
    aq * aq +
    ar * ar +
    ba * ba +
    bb * bb +
    bc * bc +
    bd * bd +
    be * be +
    bf * bf
  ) -
  (
    a * z +
    b * aa +
    c * ab +
    d * ac +
    e * ad +
    f * ae +
    g * af +
    h * ag +
    i * ah +
    j * ai +
    k * aj +
    l * ak +
    m * al +
    n * am +
    o * an +
    p * ao +
    q * ap +
    r * aq +
    s * ar +
    t * ba +
    u * bb +
    v * bc +
    w * bd +
    x * be +
    y * bf
  ) *
  (
    a * z +
    b * aa +
    c * ab +
    d * ac +
    e * ad +
    f * ae +
    g * af +
    h * ag +
    i * ah +
    j * ai +
    k * aj +
    l * ak +
    m * al +
    n * am +
    o * an +
    p * ao +
    q * ap +
    r * aq +
    s * ar +
    t * ba +
    u * bb +
    v * bc +
    w * bd +
    x * be +
    y * bf
  )
}
