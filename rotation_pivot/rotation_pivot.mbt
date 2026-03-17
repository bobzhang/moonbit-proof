///|
/// Pivot of an anchor-partitioned rotation:
/// returns the index of a minimum element, and when the answer is nonzero it
/// is exactly the first index whose value drops below `xs[0]`.
///
/// This pushes the binary-search style further than plain lower/upper bound by
/// combining a partition search with a global minimum witness postcondition.
#requires(nonempty(xs))
#requires(anchor_partition(xs))
#requires(anchor_segment_sorted(xs))
#ensures(rotation_pivot_ok(xs, result))
pub fn rotation_pivot(xs : FixedArray[Int]) -> Int {
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
      invariant: 1 <= lo,
      invariant: lo <= hi,
      invariant: hi <= xs.length(),
      invariant: ge_anchor_before(xs, lo),
      invariant: lt_anchor_from(xs, hi),
    }
  }
}
