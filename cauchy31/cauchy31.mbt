///|
/// 31-dimensional Cauchy-Schwarz identity:
///   (||u||^2)(||v||^2) - (u.v)^2
/// = Sum_{i<j} (u_i v_j - u_j v_i)^2.
#ensures(cauchy31_ok(a, b, c, d, e, f, g, h, i, j, k, l, m, n, o, p, q, r, s, t, u, v, w, x, y, z, aa, ab, ac, ad, ae, af, ag, ah, ai, aj, ak, al, am, an, ao, ap, aq, ar, ba, bb, bc, bd, be, bf, bg, bh, bi, bj, bk, bl, bm, bn, bo, bp, bq, br, result))
pub fn cauchy31_gap(
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
  bg : Int,
  bh : Int,
  bi : Int,
  bj : Int,
  bk : Int,
  bl : Int,
  bm : Int,
  bn : Int,
  bo : Int,
  bp : Int,
  bq : Int,
  br : Int,
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
    y * y +
    z * z +
    aa * aa +
    ab * ab +
    ac * ac +
    ad * ad +
    ae * ae
  ) *
  (
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
    bf * bf +
    bg * bg +
    bh * bh +
    bi * bi +
    bj * bj +
    bk * bk +
    bl * bl +
    bm * bm +
    bn * bn +
    bo * bo +
    bp * bp +
    bq * bq +
    br * br
  ) -
  (
    a * af +
    b * ag +
    c * ah +
    d * ai +
    e * aj +
    f * ak +
    g * al +
    h * am +
    i * an +
    j * ao +
    k * ap +
    l * aq +
    m * ar +
    n * ba +
    o * bb +
    p * bc +
    q * bd +
    r * be +
    s * bf +
    t * bg +
    u * bh +
    v * bi +
    w * bj +
    x * bk +
    y * bl +
    z * bm +
    aa * bn +
    ab * bo +
    ac * bp +
    ad * bq +
    ae * br
  ) *
  (
    a * af +
    b * ag +
    c * ah +
    d * ai +
    e * aj +
    f * ak +
    g * al +
    h * am +
    i * an +
    j * ao +
    k * ap +
    l * aq +
    m * ar +
    n * ba +
    o * bb +
    p * bc +
    q * bd +
    r * be +
    s * bf +
    t * bg +
    u * bh +
    v * bi +
    w * bj +
    x * bk +
    y * bl +
    z * bm +
    aa * bn +
    ab * bo +
    ac * bp +
    ad * bq +
    ae * br
  )
}
