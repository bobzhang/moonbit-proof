///|
/// Two-dimensional Cauchy-Schwarz identity:
///   (a²+b²)(c²+d²) - (ac+bd)² = (ad-bc)²
///
/// This immediately yields the 2D Cauchy inequality because the right-hand
/// side is a square.
pub fn cauchy2_gap(
  a : Int,
  b : Int,
  c : Int,
  d : Int,
) -> Int where {
  proof_ensure: result => cauchy2_ok(a, b, c, d, result),
} {
  (a * a + b * b) * (c * c + d * d) - (a * c + b * d) * (a * c + b * d)
}
