/// Sum of first n odd numbers: 1+3+5+...+(2n-1) = n²
///
/// Invariant: sum == i*i.
/// Preservation: sum + (2*i+1) = i² + 2i + 1 = (i+1)²  ✓
#requires(nonneg(n))
#ensures(sumodd_ok(n, result))
pub fn sum_odd(n : Int) -> Int {
  for i = 0, sum = 0; i < n; {
    let new_sum = sum + 2 * i + 1
    continue i + 1, new_sum
  } nobreak {
    sum
  } where {
    invariant: 0 <= i,
    invariant: i <= n,
    invariant: sum == i * i,
  }
}
