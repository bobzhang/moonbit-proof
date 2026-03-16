///|
/// Sum of falling triple products:
///   Σ i(i-1)(i-2) for i=0..n-1 = n(n-1)(n-2)(n-3)/4
///
/// This is the shifted sibling of `sum_triples`, with invariant:
///   4*sum == i(i-1)(i-2)(i-3)
#requires(nonneg(n))
#ensures(falling_products_ok(n, result))
pub fn falling_products(n : Int) -> Int {
  for i = 0, sum = 0; i < n; {
    let new_sum = sum + i * (i - 1) * (i - 2)
    continue i + 1, new_sum
  } nobreak {
    sum
  } where {
    invariant: 0 <= i,
    invariant: i <= n,
    invariant: 4 * sum == i * (i - 1) * (i - 2) * (i - 3),
  }
}
