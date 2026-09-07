///|
/// Return the last occurrence of `key` in a sorted array, or `-1` if absent.
///
/// The proof is phrased as an upper-bound search plus a witness check on the
/// predecessor position.
pub fn last_key_sorted(
  xs : FixedArray[Int],
  key : Int,
) -> Int where {
  proof_require: sorted(xs),
  proof_ensure: result => last_key_sorted_ok(xs, key, result),
} {
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
    proof_invariant: 0 <= lo,
    proof_invariant: lo <= hi,
    proof_invariant: hi <= xs.length(),
    proof_invariant: all_leq_before(xs, key, lo),
    proof_invariant: all_gt_from(xs, key, hi),
  }
  let idx = ub - 1
  if 0 <= idx && xs[idx] == key {
    idx
  } else {
    -1
  }
}
