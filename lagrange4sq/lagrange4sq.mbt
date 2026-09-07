///|
/// Lagrange's four-square identity:
/// the product of two sums of four squares is again a sum of four squares.
///
/// This is one of the most classical exact norm-multiplicativity identities.
pub fn lagrange4sq(
  a : Int,
  b : Int,
  c : Int,
  d : Int,
  e : Int,
  f : Int,
  g : Int,
  h : Int,
) -> Int where {
  proof_ensure: result => lagrange4sq_ok(a, b, c, d, e, f, g, h, result),
} {
  (a * e - b * f - c * g - d * h) * (a * e - b * f - c * g - d * h) +
  (a * f + b * e + c * h - d * g) * (a * f + b * e + c * h - d * g) +
  (a * g - b * h + c * e + d * f) * (a * g - b * h + c * e + d * f) +
  (a * h + b * g - c * f + d * e) * (a * h + b * g - c * f + d * e)
}
