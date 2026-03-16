/// Arithmetic progression sum: Σ (a + i*d) for i=0..n-1
///
/// Proves: 2*result == 2*a*n + d*n*(n-1)
///
/// Invariant: 2*sum == 2*a*i + d*i*(i-1)
/// Preservation: 2*(sum + a + i*d) = 2*a*i + d*i*(i-1) + 2*a + 2*i*d
///             = 2*a*(i+1) + d*(i²-i+2i) = 2*a*(i+1) + d*(i²+i)
///             = 2*a*(i+1) + d*(i+1)*i  ✓
#requires(nonneg(n))
#ensures(arith_ok(n, a, d, result))
pub fn arith_sum(n : Int, a : Int, d : Int) -> Int {
  for i = 0, sum = 0; i < n; {
    let new_sum = sum + a + i * d
    continue i + 1, new_sum
  } nobreak {
    sum
  } where {
    invariant: 0 <= i,
    invariant: i <= n,
    invariant: 2 * sum == 2 * a * i + d * i * (i - 1),
  }
}
