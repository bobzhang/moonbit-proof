///|
/// Three-dimensional Cauchy-Schwarz identity:
///   (‖u‖²)(‖v‖²) - (u·v)²
/// = (a*y-b*x)² + (a*z-c*x)² + (b*z-c*y)²
///
/// This is the squared norm of the 3D cross product.
#ensures(cauchy3_ok(a, b, c, x, y, z, result))
pub fn cauchy3_gap(a : Int, b : Int, c : Int, x : Int, y : Int, z : Int) -> Int {
  (a * a + b * b + c * c) * (x * x + y * y + z * z) -
  (a * x + b * y + c * z) * (a * x + b * y + c * z)
}
