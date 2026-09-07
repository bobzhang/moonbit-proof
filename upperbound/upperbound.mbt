///|
/// Upper bound binary search (dual of lowerbound)
///
/// Proves: ∀ i < result, xs[i] <= key  AND  ∀ i >= result, xs[i] > key
///
/// The difference from lowerbound: uses <= instead of < for the left side,
/// and > instead of >= for the right side. This means the boundary is at the
/// FIRST element strictly greater than key.
pub fn upper_bound(
  xs : FixedArray[Int],
  key : Int,
) -> Int where {
  proof_require: sorted(xs),
  proof_ensure: result => upper_bound_ok(xs, key, result),
} {
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
    proof_invariant: 0 <= lo,
    proof_invariant: lo <= hi,
    proof_invariant: hi <= xs.length(),
    proof_invariant: all_leq_before(xs, key, lo),
    proof_invariant: all_greater_from(xs, key, hi),
  }
}
