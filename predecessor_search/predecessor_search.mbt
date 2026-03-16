///|
/// Binary-search predecessor:
/// returns the last index whose value is `<= key`, or -1 if none exists.
///
/// The loop maintains a classic partition:
///   all positions before `lo` are valid predecessors,
///   all positions from `hi` onward are strictly greater than `key`.
#requires(sorted(xs))
#ensures(predecessor_ok(xs, key, result))
pub fn predecessor(xs : FixedArray[Int], key : Int) -> Int {
  for lo = 0, hi = xs.length(); lo < hi; {
    let mid = lo + (hi - lo) / 2
    if xs[mid] <= key {
      continue mid + 1, hi
    } else {
      continue lo, mid
    }
  } nobreak {
    lo - 1
  } where {
    invariant: 0 <= lo,
    invariant: lo <= hi,
    invariant: hi <= xs.length(),
    invariant: all_leq_before(xs, key, lo),
    invariant: all_greater_from(xs, key, hi),
  }
}
