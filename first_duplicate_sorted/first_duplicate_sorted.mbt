///|
/// First adjacent duplicate in a sorted array:
/// returns the smallest `i` such that `xs[i] == xs[i+1]`, or -1 if none exists.
///
/// Sortedness turns the absence of an adjacent duplicate into a proof that the
/// whole array is strictly increasing.
#requires(sorted(xs))
#ensures(first_duplicate_ok(xs, result))
pub fn first_duplicate(xs : FixedArray[Int]) -> Int {
  for i = 0, found = -1; i < xs.length() - 1; {
    let new_found = if found == -1 && xs[i] == xs[i + 1] { i } else { found }
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
      xs[found] == xs[found + 1]
    ),
    invariant: strict_when_unfound(xs, found, i + 1),
    invariant: strict_upto(xs, found + 1),
  }
}
