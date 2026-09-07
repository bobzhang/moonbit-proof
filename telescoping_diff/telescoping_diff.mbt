///|
/// Telescoping sum of successive differences:
///   Σ (xs[i+1] - xs[i]) = xs[n-1] - xs[0]
///
/// The invariant keeps the partial sum synchronized with the current endpoint:
///   sum == xs[i] - xs[0]
pub fn telescoping_diff(
  xs : FixedArray[Int],
) -> Int where {
  proof_require: has_two(xs),
  proof_ensure: result => telescoping_ok(xs, result),
} {
  for i = 0, sum = 0; i < xs.length() - 1; {
    let new_sum = sum + xs[i + 1] - xs[i]
    continue i + 1, new_sum
  } nobreak {
    sum
  } where {
    proof_invariant: 0 <= i,
    proof_invariant: i <= xs.length() - 1,
    proof_invariant: sum == xs[i] - xs[0],
  }
}
