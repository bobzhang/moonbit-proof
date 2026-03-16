///|
/// First descent witness:
/// returns the smallest `i` such that `xs[i] > xs[i+1]`, or -1 if none exists.
///
/// Compared with the boolean `checksorted` example, this package proves an
/// actual witness and still recovers global sortedness when the answer is -1.
#ensures(first_descent_ok(xs, result))
pub fn first_descent(xs : FixedArray[Int]) -> Int {
  for i = 0, found = -1; i < xs.length() - 1; {
    let new_found = if found == -1 && xs[i] > xs[i + 1] { i } else { found }
    continue i + 1, new_found
  } nobreak {
    found
  } where {
    invariant: 0 <= i,
    invariant: found == -1 ||
    (
      0 <= found &&
      found < i &&
      found + 1 < xs.length() &&
      xs[found] > xs[found + 1]
    ),
    invariant: adj_sorted_when_unfound(xs, found, i + 1),
    invariant: adj_sorted_upto(xs, found + 1),
  }
}
