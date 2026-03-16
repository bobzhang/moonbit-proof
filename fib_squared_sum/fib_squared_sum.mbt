/// Fibonacci sum of squares: Σ F(k)² for k=0..n-1 = F(n-1)*F(n)
///
/// Tracks a=F(i), b=F(i+1), sqsum=ΣF(k)² for k=0..i-1.
/// The identity: sqsum = a*b - a*a (since F(n-1)*F(n) = a*(b-a+a)
/// and the telescoping works out to a*b - a²).
///
/// Preservation: new_sqsum = sqsum + a² = (a*b - a²) + a² = a*b.
/// And new_a = b, new_b = a+b.
/// Need: a*b == new_a*new_b - new_a² = b*(a+b) - b² = ab.  ✓
///
/// One of the most elegant Fibonacci identities.
#requires(nonneg(n))
#ensures(fib_sq_ok(result))
pub fn fib_sum_of_squares(n : Int) -> Int {
  for i = 0, a = 0, b = 1, sqsum = 0; i < n; {
    let new_sqsum = sqsum + a * a
    let new_a = b
    let new_b = a + b
    continue i + 1, new_a, new_b, new_sqsum
  } nobreak {
    sqsum - a * b + a * a
  } where {
    invariant: 0 <= i,
    invariant: i <= n,
    invariant: a >= 0,
    invariant: b >= 1,
    invariant: sqsum == a * b - a * a,
  }
}
