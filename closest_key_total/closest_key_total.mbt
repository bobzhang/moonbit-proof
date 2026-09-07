///|
/// Closest-to-key witness in a nonempty sorted array, with no key-range
/// precondition.
///
/// If the key is outside the array range, an endpoint is returned. Otherwise
/// the proof reduces to the split-around-key argument from `closest_key_sorted`.
pub fn closest_key_total(
  xs : FixedArray[Int],
  key : Int,
) -> Int where {
  proof_require: nonempty(xs),
  proof_require: sorted(xs),
  proof_ensure: result => closest_key_total_ok(xs, key, result),
} {
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
      proof_invariant: 0 <= lo,
      proof_invariant: lo <= hi,
      proof_invariant: hi <= xs.length(),
      proof_invariant: all_lt_before(xs, key, lo),
      proof_invariant: all_geq_from(xs, key, hi),
    }
    let left = lo - 1
    if key - xs[left] <= xs[lo] - key {
      left
    } else {
      lo
    }
  }
}
