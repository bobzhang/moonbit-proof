///|
/// Closest-to-key witness in a sorted array when the key lies inside the range.
///
/// The search finds the first element `>= key`, then compares the two boundary
/// candidates around that split.
#requires(sorted(xs))
#requires(key_in_range(xs, key))
#ensures(closest_key_ok(xs, key, result))
pub fn closest_key_index(xs : FixedArray[Int], key : Int) -> Int {
  let lo = for lo = 0, hi = xs.length(); lo < hi; {
    let mid = lo + (hi - lo) / 2
    if xs[mid] < key {
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
    invariant: all_lt_before(xs, key, lo),
    invariant: all_geq_from(xs, key, hi),
  }
  let left = lo - 1
  if key - xs[left] <= xs[lo] - key {
    left
  } else {
    lo
  }
}
