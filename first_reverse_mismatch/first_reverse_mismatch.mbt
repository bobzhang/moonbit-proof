///|
/// First reverse mismatch witness:
/// returns the smallest `i` such that `xs[i] != ys[n-1-i]`, or -1 if the
/// arrays are reverse-equal.
#requires(same_length(xs, ys))
#ensures(first_reverse_mismatch_ok(xs, ys, result))
pub fn first_reverse_mismatch(
  xs : FixedArray[Int],
  ys : FixedArray[Int],
) -> Int {
  for i = 0, found = -1; i < xs.length(); {
    let new_found = if found == -1 && xs[i] != ys[ys.length() - 1 - i] {
      i
    } else {
      found
    }
    continue i + 1, new_found
  } nobreak {
    found
  } where {
    invariant: 0 <= i,
    invariant: i <= xs.length(),
    invariant: found == -1 ||
    (0 <= found && found < i && xs[found] != ys[ys.length() - 1 - found]),
    invariant: reverse_prefix_when_unfound(xs, ys, found, i),
    invariant: reverse_equal_before(xs, ys, found),
  }
}
