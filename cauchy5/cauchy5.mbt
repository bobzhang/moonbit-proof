///|
/// Five-dimensional Cauchy-Schwarz identity:
///   (||u||^2)(||v||^2) - (u.v)^2
/// = Sum_{i<j} (u_i v_j - u_j v_i)^2.
///
/// This keeps pushing the exact-identity approach beyond the existing 2D-4D
/// examples.
#ensures(cauchy5_ok(a, b, c, d, e, p, q, r, s, t, result))
pub fn cauchy5_gap(
  a : Int,
  b : Int,
  c : Int,
  d : Int,
  e : Int,
  p : Int,
  q : Int,
  r : Int,
  s : Int,
  t : Int,
) -> Int {
  (a * a + b * b + c * c + d * d + e * e) *
  (p * p + q * q + r * r + s * s + t * t) -
  (a * p + b * q + c * r + d * s + e * t) *
  (a * p + b * q + c * r + d * s + e * t)
}
