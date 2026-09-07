///|
/// Binary Search: Lower Bound
///
/// Finds the first position where `key` could be inserted into a sorted array
/// while maintaining sort order. Equivalently, returns the index of the first
/// element >= key, or `xs.length()` if all elements are strictly less than key.
///
/// Binary search is notoriously error-prone. Knuth observed that it took 17
/// years from the first binary search paper (1946) to the first correct
/// published implementation (1962). Off-by-one errors, infinite loops, and
/// wrong boundary updates remain common pitfalls. This proof eliminates them.
pub fn lower_bound(
  xs : FixedArray[Int],
  key : Int,
) -> Int where {
  proof_require: sorted(xs),
  proof_ensure: result => lower_bound_ok(xs, key, result),
} {
  for lo = 0, hi = xs.length(); lo < hi; {
    let mid = lo + (hi - lo) / 2
    if xs[mid] < key {
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
    proof_invariant: all_less_before(xs, key, lo),
    proof_invariant: all_geq_from(xs, key, hi),
    proof_reasoning: (
      #| We maintain a search window [lo, hi) with two quantified invariants:
      #|   - `all_less_before(xs, key, lo)` -- every element before `lo` is < key
      #|   - `all_geq_from(xs, key, hi)` -- every element from `hi` onward is >= key
      #|
      #| Initialization: lo=0 and hi=length. `all_less_before` holds vacuously
      #| (no elements before index 0). `all_geq_from` holds vacuously (no elements
      #| from `length` onward).
      #|
      #| Preservation: At each step we examine the midpoint mid:
      #|   - If xs[mid] < key: we set lo = mid+1. The invariant `all_less_before`
      #|     extends because we already knew everything before old-lo was < key,
      #|     and now xs[mid] < key too, covering indices up to mid+1.
      #|   - If xs[mid] >= key: we set hi = mid. Since the array is sorted and
      #|     xs[mid] >= key, all elements from mid onward are >= key, so
      #|     `all_geq_from` holds at mid.
      #|
      #| Postcondition: When lo == hi, the two invariants combine: everything
      #| before `lo` is < key, everything from `lo` onward is >= key. This is the
      #| exact boundary -- the lower bound.
    ),
  }
}
