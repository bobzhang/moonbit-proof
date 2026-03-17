///|
/// Seven-dimensional Cauchy-Schwarz identity:
///   (||u||^2)(||v||^2) - (u.v)^2
/// = Sum_{i<j} (u_i v_j - u_j v_i)^2.
#ensures(cauchy7_ok(a, b, c, d, e, f, g, p, q, r, s, t, u, v, result))
pub fn cauchy7_gap(
  a : Int,
  b : Int,
  c : Int,
  d : Int,
  e : Int,
  f : Int,
  g : Int,
  p : Int,
  q : Int,
  r : Int,
  s : Int,
  t : Int,
  u : Int,
  v : Int,
) -> Int {
  (a * a + b * b + c * c + d * d + e * e + f * f + g * g) *
  (p * p + q * q + r * r + s * s + t * t + u * u + v * v) -
  (a * p + b * q + c * r + d * s + e * t + f * u + g * v) *
  (a * p + b * q + c * r + d * s + e * t + f * u + g * v)
}
