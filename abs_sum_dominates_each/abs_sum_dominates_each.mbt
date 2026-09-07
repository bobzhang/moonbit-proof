///|
/// The sum of absolute values dominates every individual absolute value.
///
/// Returns `Σ |xs[i]|` and proves that every `|xs[k]|` is bounded by the
/// returned value.
pub fn abs_sum(
  xs : FixedArray[Int],
) -> Int where {
  proof_ensure: result => abs_sum_dominates_each_ok(xs, result),
} {
  for i = 0, sum = 0; i < xs.length(); {
    let x = xs[i]
    let abs_x = if x >= 0 { x } else { -x }
    let new_sum = sum + abs_x
    continue i + 1, new_sum
  } nobreak {
    sum
  } where {
    proof_invariant: 0 <= i,
    proof_invariant: i <= xs.length(),
    proof_invariant: sum >= 0,
    proof_invariant: abs_prefix_bounded(xs, sum, i),
  }
}
