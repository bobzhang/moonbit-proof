///|
/// Bernoulli's Inequality: (1+x)^n >= 1+n*x for x >= 0
///
/// A cornerstone inequality in analysis. Tracks pow = (1+x)^i and
/// lin = 1+i*x simultaneously. The invariant pow >= lin is maintained
/// because: pow*(1+x) >= lin*(1+x) = lin + lin*x >= lin + x
/// (since lin >= 1 and x >= 0, so lin*x >= x).
///
/// Returns pow - lin, proving >= 0.
pub fn bernoulli(
  x : Int,
  n : Int,
) -> Int where {
  proof_require: nonneg_x(x),
  proof_require: nonneg_n(n),
  proof_ensure: result => bernoulli_ok(result),
} {
  for i = 0, pow = 1, lin = 1; i < n; {
    let new_pow = pow * (1 + x)
    let new_lin = lin + x
    continue i + 1, new_pow, new_lin
  } nobreak {
    pow - lin
  } where {
    proof_invariant: 0 <= i,
    proof_invariant: i <= n,
    proof_invariant: pow >= 1,
    proof_invariant: lin >= 1,
    proof_invariant: pow >= lin,
  }
}
