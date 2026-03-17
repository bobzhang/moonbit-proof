///|
/// Return the left index of a closest pair in a sorted array.
///
/// The postcondition is global: the adjacent gap at `result` is at most the
/// gap between any two elements in the whole array.
#requires(at_least_two(xs))
#requires(sorted(xs))
#ensures(closest_pair_sorted_ok(xs, result))
pub fn closest_pair_sorted(xs : FixedArray[Int]) -> Int {
  for i = 1, best = 0; i < xs.length() - 1; {
    let best_gap = xs[best + 1] - xs[best]
    let cur_gap = xs[i + 1] - xs[i]
    let new_best = if cur_gap < best_gap { i } else { best }
    continue i + 1, new_best
  } nobreak {
    best
  } where {
    invariant: 1 <= i,
    invariant: i <= xs.length() - 1,
    invariant: 0 <= best,
    invariant: best < i,
    invariant: closest_pair_prefix(xs, best, i),
  }
}
