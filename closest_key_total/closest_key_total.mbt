///|
/// Closest-to-key witness in a nonempty sorted array, with no key-range
/// precondition.
///
/// If the key is outside the array range, an endpoint is returned. Otherwise
/// the proof reduces to the split-around-key argument from `closest_key_sorted`.
#requires(nonempty(xs))
#requires(sorted(xs))
#ensures(closest_key_total_ok(xs, key, result))
pub fn closest_key_total(xs : FixedArray[Int], key : Int) -> Int {
  if key <= xs[0] {
    0
  } else if xs[xs.length() - 1] < key {
    xs.length() - 1
  } else {
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
}
