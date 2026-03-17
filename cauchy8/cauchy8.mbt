///|
/// Eight-dimensional Cauchy-Schwarz identity:
///   (||u||^2)(||v||^2) - (u.v)^2
/// = Sum_{i<j} (u_i v_j - u_j v_i)^2.
#ensures(cauchy8_ok(a, b, c, d, e, f, g, h, p, q, r, s, t, u, v, w, result))
pub fn cauchy8_gap(
  a : Int,
  b : Int,
  c : Int,
  d : Int,
  e : Int,
  f : Int,
  g : Int,
  h : Int,
  p : Int,
  q : Int,
  r : Int,
  s : Int,
  t : Int,
  u : Int,
  v : Int,
  w : Int,
) -> Int {
  (a * a + b * b + c * c + d * d + e * e + f * f + g * g + h * h) *
  (p * p + q * q + r * r + s * s + t * t + u * u + v * v + w * w) -
  (a * p + b * q + c * r + d * s + e * t + f * u + g * v + h * w) *
  (a * p + b * q + c * r + d * s + e * t + f * u + g * v + h * w)
}
