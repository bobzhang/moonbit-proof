///|
/// The sum of absolute values dominates every individual absolute value.
///
/// Returns `Σ |xs[i]|` and proves that every `|xs[k]|` is bounded by the
/// returned value.
#ensures(abs_sum_dominates_each_ok(xs, result))
pub fn abs_sum(xs : FixedArray[Int]) -> Int {
  for i = 0, sum = 0; i < xs.length(); {
    let x = xs[i]
    let abs_x = if x >= 0 { x } else { -x }
    let new_sum = sum + abs_x
    continue i + 1, new_sum
  } nobreak {
    sum
  } where {
    invariant: 0 <= i,
    invariant: i <= xs.length(),
    invariant: sum >= 0,
    invariant: abs_prefix_bounded(xs, sum, i),
  }
}
