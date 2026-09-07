///|
/// Closest-to-key witness in a sorted array when the key lies inside the range.
///
/// The search finds the first element `>= key`, then compares the two boundary
/// candidates around that split.
pub fn closest_key_index(
  xs : FixedArray[Int],
  key : Int,
) -> Int where {
  proof_require: sorted(xs),
  proof_require: key_in_range(xs, key),
  proof_ensure: result => closest_key_ok(xs, key, result),
} {
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
