///|
/// Closest-to-zero witness in a sorted array that crosses zero.
///
/// The search first finds the first nonnegative element, then chooses between
/// the two boundary candidates around zero. The postcondition proves the
/// returned index has globally minimal absolute value.
pub fn closest_zero_index(
  xs : FixedArray[Int],
) -> Int where {
  proof_require: sorted(xs),
  proof_require: crosses_zero(xs),
  proof_ensure: result => closest_zero_ok(xs, result),
} {
  let lo = for lo = 0, hi = xs.length(); lo < hi; {
    let mid = lo + (hi - lo) / 2
    if xs[mid] < 0 {
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
    proof_invariant: all_neg_before(xs, lo),
    proof_invariant: all_nonneg_from(xs, hi),
  }
  let left = lo - 1
  if -xs[left] <= xs[lo] {
    left
  } else {
    lo
  }
}
