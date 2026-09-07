///|
/// Binary-search predecessor:
/// returns the last index whose value is `<= key`, or -1 if none exists.
///
/// The loop maintains a classic partition:
///   all positions before `lo` are valid predecessors,
///   all positions from `hi` onward are strictly greater than `key`.
pub fn predecessor(
  xs : FixedArray[Int],
  key : Int,
) -> Int where {
  proof_require: sorted(xs),
  proof_ensure: result => predecessor_ok(xs, key, result),
} {
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
    proof_invariant: 0 <= lo,
    proof_invariant: lo <= hi,
    proof_invariant: hi <= xs.length(),
    proof_invariant: all_leq_before(xs, key, lo),
    proof_invariant: all_greater_from(xs, key, hi),
  }
}
