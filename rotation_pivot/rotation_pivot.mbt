///|
/// Pivot of an anchor-partitioned rotation:
/// returns the index of a minimum element, and when the answer is nonzero it
/// is exactly the first index whose value drops below `xs[0]`.
///
/// This pushes the binary-search style further than plain lower/upper bound by
/// combining a partition search with a global minimum witness postcondition.
pub fn rotation_pivot(
  xs : FixedArray[Int],
) -> Int where {
  proof_require: nonempty(xs),
  proof_require: anchor_partition(xs),
  proof_require: anchor_segment_sorted(xs),
  proof_ensure: result => rotation_pivot_ok(xs, result),
} {
  if xs[xs.length() - 1] >= xs[0] {
    0
  } else {
    for lo = 1, hi = xs.length(); lo < hi; {
      let mid = lo + (hi - lo) / 2
      if xs[mid] >= xs[0] {
        continue mid + 1, hi
      } else {
        continue lo, mid
      }
    } nobreak {
      lo
    } where {
      proof_invariant: 1 <= lo,
      proof_invariant: lo <= hi,
      proof_invariant: hi <= xs.length(),
      proof_invariant: ge_anchor_before(xs, lo),
      proof_invariant: lt_anchor_from(xs, hi),
    }
  }
}
