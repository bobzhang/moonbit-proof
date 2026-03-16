/// Geometric series identity: (r-1) * Σ_{k=0}^{n-1} r^k = r^n - 1
///
/// Tracks sum = Σ r^k and pow = r^i simultaneously.
/// The cross-accumulator invariant (r-1)*sum == pow - 1 encodes
/// the partial geometric series identity.
///
/// Preservation:
///   new_sum = sum + pow, new_pow = pow * r.
///   (r-1)*(sum + pow) = (r-1)*sum + (r-1)*pow
///                     = (pow - 1) + r*pow - pow
///                     = r*pow - 1 = new_pow - 1  ✓
#requires(nonneg(n))
#ensures(geom_ok(result))
pub fn geometric_series(n : Int, r : Int) -> Int {
  for i = 0, sum = 0, pow = 1; i < n; {
    let new_sum = sum + pow
    let new_pow = pow * r
    continue i + 1, new_sum, new_pow
  } nobreak {
    (r - 1) * sum - pow + 1
  } where {
    invariant: 0 <= i,
    invariant: i <= n,
    invariant: (r - 1) * sum == pow - 1,
  }
}
