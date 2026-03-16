///|
/// Sum of consecutive triple products:
///   Σ i(i+1)(i+2) for i=0..n-1 = n(n-1)(n+1)(n+2)/4
///
/// The invariant is quartic but still SMT-friendly:
///   4*sum == i(i-1)(i+1)(i+2)
#requires(nonneg(n))
#ensures(sum_triples_ok(n, result))
pub fn sum_triples(n : Int) -> Int {
  for i = 0, sum = 0; i < n; {
    let new_sum = sum + i * (i + 1) * (i + 2)
    continue i + 1, new_sum
  } nobreak {
    sum
  } where {
    invariant: 0 <= i,
    invariant: i <= n,
    invariant: 4 * sum == i * (i - 1) * (i + 1) * (i + 2),
  }
}
