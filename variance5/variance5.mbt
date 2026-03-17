///|
/// Five-point variance identity:
///   5 * Σ x_i² - (Σ x_i)² = Σ_{i<j} (x_i - x_j)²
///
/// This is the exact finite-dimensional variance/Cauchy identity for 5 values.
#ensures(variance5_ok(a, b, c, d, e, result))
pub fn variance5_gap(a : Int, b : Int, c : Int, d : Int, e : Int) -> Int {
  5 * (a * a + b * b + c * c + d * d + e * e) -
  (a + b + c + d + e) * (a + b + c + d + e)
}
