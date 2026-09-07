///|
/// Partition point in a monotone 0/1 array:
/// returns the first index containing `1`, or `n` if no such index exists.
///
/// This is a specialized binary search with the postcondition written as a
/// clean zero-prefix / one-suffix split.
pub fn first_one(
  xs : FixedArray[Int],
) -> Int where {
  proof_require: bits(xs),
  proof_require: bit_sorted(xs),
  proof_ensure: result => bit_partition_ok(xs, result),
} {
  for lo = 0, hi = xs.length(); lo < hi; {
    let mid = lo + (hi - lo) / 2
    if xs[mid] == 0 {
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
    proof_invariant: all_zero_before(xs, lo),
    proof_invariant: all_one_from(xs, hi),
  }
}
