/// Bernoulli's Inequality: (1+x)^n >= 1+n*x for x >= 0
///
/// A cornerstone inequality in analysis. Tracks pow = (1+x)^i and
/// lin = 1+i*x simultaneously. The invariant pow >= lin is maintained
/// because: pow*(1+x) >= lin*(1+x) = lin + lin*x >= lin + x
/// (since lin >= 1 and x >= 0, so lin*x >= x).
///
/// Returns pow - lin, proving >= 0.
#requires(nonneg_x(x))
#requires(nonneg_n(n))
#ensures(bernoulli_ok(result))
pub fn bernoulli(x : Int, n : Int) -> Int {
  for i = 0, pow = 1, lin = 1; i < n; {
    let new_pow = pow * (1 + x)
    let new_lin = lin + x
    continue i + 1, new_pow, new_lin
  } nobreak {
    pow - lin
  } where {
    invariant: 0 <= i,
    invariant: i <= n,
    invariant: pow >= 1,
    invariant: lin >= 1,
    invariant: pow >= lin,
  }
}
