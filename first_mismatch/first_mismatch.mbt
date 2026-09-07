///|
/// First mismatch witness:
/// returns the smallest index where `xs[i] != ys[i]`, or -1 if none exists.
///
/// The proof keeps three facts:
///   1. `found` is either -1 or a real mismatch already seen
///   2. if `found == -1`, then the scanned prefix matches
///   3. if `found != -1`, all earlier positions still match
pub fn first_mismatch(
  xs : FixedArray[Int],
  ys : FixedArray[Int],
) -> Int where {
  proof_require: same_length(xs, ys),
  proof_ensure: result => first_mismatch_ok(xs, ys, result),
} {
  for i = 0, found = -1; i < xs.length(); {
    let new_found = if found == -1 && xs[i] != ys[i] { i } else { found }
    continue i + 1, new_found
  } nobreak {
    found
  } where {
    proof_invariant: 0 <= i,
    proof_invariant: i <= xs.length(),
    proof_invariant: found == -1 ||
    (0 <= found && found < i && xs[found] != ys[found]),
    proof_invariant: eq_prefix_when_unfound(xs, ys, found, i),
    proof_invariant: equal_before(xs, ys, found),
  }
}
