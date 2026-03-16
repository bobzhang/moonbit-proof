///|
/// Sum of cubes:
///   Σ i³ for i=0..n-1 = (n(n-1)/2)²
///
/// To avoid division in the proof obligation, the postcondition is:
///   4*result == n²(n-1)²
///
/// Invariant:
///   4*sum == i²(i-1)²
#requires(nonneg(n))
#ensures(sum_cubes_ok(n, result))
pub fn sum_cubes(n : Int) -> Int {
  for i = 0, sum = 0; i < n; {
    let new_sum = sum + i * i * i
    continue i + 1, new_sum
  } nobreak {
    sum
  } where {
    invariant: 0 <= i,
    invariant: i <= n,
    invariant: 4 * sum == i * i * (i - 1) * (i - 1),
  }
}
