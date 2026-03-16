/// Upper bound binary search (dual of lowerbound)
///
/// Proves: ∀ i < result, xs[i] <= key  AND  ∀ i >= result, xs[i] > key
///
/// The difference from lowerbound: uses <= instead of < for the left side,
/// and > instead of >= for the right side. This means the boundary is at the
/// FIRST element strictly greater than key.
#requires(sorted(xs))
#ensures(upper_bound_ok(xs, key, result))
pub fn upper_bound(xs : FixedArray[Int], key : Int) -> Int {
  for lo = 0, hi = xs.length(); lo < hi; {
    let mid = lo + (hi - lo) / 2
    if xs[mid] <= key {
      continue mid + 1, hi
    } else {
      continue lo, mid
    }
  } nobreak {
    lo
  } where {
    invariant: 0 <= lo,
    invariant: lo <= hi,
    invariant: hi <= xs.length(),
    invariant: all_leq_before(xs, key, lo),
    invariant: all_greater_from(xs, key, hi),
  }
}
