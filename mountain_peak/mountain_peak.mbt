///|
/// Peak boundary in a strict mountain array.
///
/// Returns the first index `i` such that `xs[i] > xs[i+1]`. Equivalently,
/// everything before the result is still rising, and from the result onward the
/// array is strictly descending.
pub fn mountain_peak(
  xs : FixedArray[Int],
) -> Int where {
  proof_require: has_peak(xs),
  proof_require: adjacent_distinct(xs),
  proof_require: rise_partition(xs),
  proof_require: descent_partition(xs),
  proof_ensure: result => mountain_peak_ok(xs, result),
} {
  for lo = 0, hi = xs.length() - 1; lo < hi; {
    let mid = lo + (hi - lo) / 2
    if xs[mid] < xs[mid + 1] {
      continue mid + 1, hi
    } else {
      continue lo, mid
    }
  } nobreak {
    lo
  } where {
    proof_invariant: 0 <= lo,
    proof_invariant: lo <= hi,
    proof_invariant: hi < xs.length(),
    proof_invariant: rising_before(xs, lo),
    proof_invariant: descending_from(xs, hi),
  }
}
