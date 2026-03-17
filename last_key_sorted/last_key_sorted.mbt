///|
/// Return the last occurrence of `key` in a sorted array, or `-1` if absent.
///
/// The proof is phrased as an upper-bound search plus a witness check on the
/// predecessor position.
#requires(sorted(xs))
#ensures(last_key_sorted_ok(xs, key, result))
pub fn last_key_sorted(xs : FixedArray[Int], key : Int) -> Int {
  let ub = for lo = 0, hi = xs.length(); lo < hi; {
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
    invariant: all_gt_from(xs, key, hi),
  }
  let idx = ub - 1
  if 0 <= idx && xs[idx] == key {
    idx
  } else {
    -1
  }
}
