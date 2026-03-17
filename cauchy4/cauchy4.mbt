///|
/// Four-dimensional Cauchy-Schwarz identity:
///   (‖u‖²)(‖v‖²) - (u·v)²
/// = Σ_{i<j} (u_i v_j - u_j v_i)²
///
/// This is the 4D analogue of the `cauchy3` cross-product identity.
#ensures(cauchy4_ok(a, b, c, d, w, x, y, z, result))
pub fn cauchy4_gap(
  a : Int,
  b : Int,
  c : Int,
  d : Int,
  w : Int,
  x : Int,
  y : Int,
  z : Int,
) -> Int {
  (a * a + b * b + c * c + d * d) * (w * w + x * x + y * y + z * z) -
  (a * w + b * x + c * y + d * z) * (a * w + b * x + c * y + d * z)
}
