///|
/// Four-point variance identity:
///   4 * Σ x_i² - (Σ x_i)² = Σ_{i<j} (x_i - x_j)²
///
/// For four variables this expands to a six-term sum of pairwise squares.
pub fn variance4_gap(
  a : Int,
  b : Int,
  c : Int,
  d : Int,
) -> Int where {
  proof_ensure: result => variance4_ok(a, b, c, d, result),
} {
  4 * (a * a + b * b + c * c + d * d) - (a + b + c + d) * (a + b + c + d)
}
