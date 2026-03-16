///|
/// Triangle inequality for integer arrays:
///   Σ |xs[i]| >= |Σ xs[i]|
///
/// Returns `Σ|xs[i]| - |Σ xs[i]|`, proving the gap is non-negative.
///
/// The key invariant is the encoded absolute-value bound:
///   abs_sum >= total  and  abs_sum >= -total
#ensures(abs_sum_bound_ok(result))
pub fn abs_sum_gap(xs : FixedArray[Int]) -> Int {
  for i = 0, abs_sum = 0, total = 0; i < xs.length(); {
    let x = xs[i]
    let abs_x = if x >= 0 { x } else { -x }
    let new_abs_sum = abs_sum + abs_x
    let new_total = total + x
    continue i + 1, new_abs_sum, new_total
  } nobreak {
    let abs_total = if total >= 0 { total } else { -total }
    abs_sum - abs_total
  } where {
    invariant: 0 <= i,
    invariant: i <= xs.length(),
    invariant: abs_sum >= total,
    invariant: abs_sum >= -total,
  }
}
