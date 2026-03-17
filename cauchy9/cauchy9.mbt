///|
/// Nine-dimensional Cauchy-Schwarz identity:
///   (||u||^2)(||v||^2) - (u.v)^2
/// = Sum_{i<j} (u_i v_j - u_j v_i)^2.
#ensures(cauchy9_ok(a, b, c, d, e, f, g, h, i, p, q, r, s, t, u, v, w, x, result))
pub fn cauchy9_gap(
  a : Int,
  b : Int,
  c : Int,
  d : Int,
  e : Int,
  f : Int,
  g : Int,
  h : Int,
  i : Int,
  p : Int,
  q : Int,
  r : Int,
  s : Int,
  t : Int,
  u : Int,
  v : Int,
  w : Int,
  x : Int,
) -> Int {
  (a * a + b * b + c * c + d * d + e * e + f * f + g * g + h * h + i * i) *
  (p * p + q * q + r * r + s * s + t * t + u * u + v * v + w * w + x * x) -
  (a * p + b * q + c * r + d * s + e * t + f * u + g * v + h * w + i * x) *
  (a * p + b * q + c * r + d * s + e * t + f * u + g * v + h * w + i * x)
}
