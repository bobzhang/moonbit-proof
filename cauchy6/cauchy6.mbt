///|
/// Six-dimensional Cauchy-Schwarz identity:
///   (||u||^2)(||v||^2) - (u.v)^2
/// = Sum_{i<j} (u_i v_j - u_j v_i)^2.
#ensures(cauchy6_ok(a, b, c, d, e, f, p, q, r, s, t, u, result))
pub fn cauchy6_gap(
  a : Int,
  b : Int,
  c : Int,
  d : Int,
  e : Int,
  f : Int,
  p : Int,
  q : Int,
  r : Int,
  s : Int,
  t : Int,
  u : Int,
) -> Int {
  (a * a + b * b + c * c + d * d + e * e + f * f) *
  (p * p + q * q + r * r + s * s + t * t + u * u) -
  (a * p + b * q + c * r + d * s + e * t + f * u) *
  (a * p + b * q + c * r + d * s + e * t + f * u)
}
