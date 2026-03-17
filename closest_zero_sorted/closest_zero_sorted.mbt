///|
/// Closest-to-zero witness in a sorted array that crosses zero.
///
/// The search first finds the first nonnegative element, then chooses between
/// the two boundary candidates around zero. The postcondition proves the
/// returned index has globally minimal absolute value.
#requires(sorted(xs))
#requires(crosses_zero(xs))
#ensures(closest_zero_ok(xs, result))
pub fn closest_zero_index(xs : FixedArray[Int]) -> Int {
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
    invariant: 0 <= lo,
    invariant: lo <= hi,
    invariant: hi <= xs.length(),
    invariant: all_neg_before(xs, lo),
    invariant: all_nonneg_from(xs, hi),
  }
  let left = lo - 1
  if -xs[left] <= xs[lo] {
    left
  } else {
    lo
  }
}
