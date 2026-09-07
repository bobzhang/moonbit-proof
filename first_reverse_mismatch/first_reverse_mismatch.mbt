///|
/// First reverse mismatch witness:
/// returns the smallest `i` such that `xs[i] != ys[n-1-i]`, or -1 if the
/// arrays are reverse-equal.
pub fn first_reverse_mismatch(
  xs : FixedArray[Int],
  ys : FixedArray[Int],
) -> Int where {
  proof_require: same_length(xs, ys),
  proof_ensure: result => first_reverse_mismatch_ok(xs, ys, result),
} {
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
    proof_invariant: 0 <= i,
    proof_invariant: i <= xs.length(),
    proof_invariant: found == -1 ||
    (0 <= found && found < i && xs[found] != ys[ys.length() - 1 - found]),
    proof_invariant: reverse_prefix_when_unfound(xs, ys, found, i),
    proof_invariant: reverse_equal_before(xs, ys, found),
  }
}
