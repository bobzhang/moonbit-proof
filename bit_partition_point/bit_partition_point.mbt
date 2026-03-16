///|
/// Partition point in a monotone 0/1 array:
/// returns the first index containing `1`, or `n` if no such index exists.
///
/// This is a specialized binary search with the postcondition written as a
/// clean zero-prefix / one-suffix split.
#requires(bits(xs))
#requires(bit_sorted(xs))
#ensures(bit_partition_ok(xs, result))
pub fn first_one(xs : FixedArray[Int]) -> Int {
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
    invariant: 0 <= lo,
    invariant: lo <= hi,
    invariant: hi <= xs.length(),
    invariant: all_zero_before(xs, lo),
    invariant: all_one_from(xs, hi),
  }
}
