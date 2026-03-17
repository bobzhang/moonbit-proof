///|
/// Peak boundary in a strict mountain array.
///
/// Returns the first index `i` such that `xs[i] > xs[i+1]`. Equivalently,
/// everything before the result is still rising, and from the result onward the
/// array is strictly descending.
#requires(has_peak(xs))
#requires(adjacent_distinct(xs))
#requires(rise_partition(xs))
#requires(descent_partition(xs))
#ensures(mountain_peak_ok(xs, result))
pub fn mountain_peak(xs : FixedArray[Int]) -> Int {
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
    invariant: 0 <= lo,
    invariant: lo <= hi,
    invariant: hi < xs.length(),
    invariant: rising_before(xs, lo),
    invariant: descending_from(xs, hi),
  }
}
