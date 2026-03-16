///|
/// Telescoping sum of successive differences:
///   Σ (xs[i+1] - xs[i]) = xs[n-1] - xs[0]
///
/// The invariant keeps the partial sum synchronized with the current endpoint:
///   sum == xs[i] - xs[0]
#requires(has_two(xs))
#ensures(telescoping_ok(xs, result))
pub fn telescoping_diff(xs : FixedArray[Int]) -> Int {
  for i = 0, sum = 0; i < xs.length() - 1; {
    let new_sum = sum + xs[i + 1] - xs[i]
    continue i + 1, new_sum
  } nobreak {
    sum
  } where {
    invariant: 0 <= i,
    invariant: i <= xs.length() - 1,
    invariant: sum == xs[i] - xs[0],
  }
}
