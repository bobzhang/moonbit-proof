///|
/// Closest Pair in a Sorted Array
///
/// Proves the classic computational geometry theorem: in a sorted array, a
/// globally closest pair of elements must be adjacent. Returns the left index
/// of such a pair.
///
/// The postcondition is remarkably strong — it quantifies over ALL pairs (j, k)
/// in the entire array, not just adjacent ones, and proves that no distant pair
/// can have a smaller gap than the pair at `result`.
#requires(at_least_two(xs))
#requires(sorted(xs))
#ensures(closest_pair_sorted_ok(xs, result))
pub fn closest_pair_sorted(xs : FixedArray[Int]) -> Int {
  for i = 1, best = 0; i < xs.length() - 1; {
    let best_gap = xs[best + 1] - xs[best]
    let cur_gap = xs[i + 1] - xs[i]
    let new_best = if cur_gap < best_gap { i } else { best }
    continue i + 1, new_best
  } nobreak {
    best
  } where {
    invariant: 1 <= i,
    invariant: i <= xs.length() - 1,
    invariant: 0 <= best,
    invariant: best < i,
    invariant: closest_pair_prefix(xs, best, i),
    reasoning: (
      #| Key insight: In a sorted array, the distance between any two elements
      #| xs[j] and xs[k] (where j < k) decomposes into a sum of adjacent gaps:
      #|
      #|   xs[k] - xs[j] = (xs[j+1]-xs[j]) + (xs[j+2]-xs[j+1]) + ... + (xs[k]-xs[k-1])
      #|
      #| Each adjacent gap is non-negative (because the array is sorted), and the
      #| sum of non-negative terms is >= each individual term. Therefore:
      #|   xs[k] - xs[j] >= min adjacent gap
      #|
      #| This means the globally closest pair can always be found among adjacent
      #| elements -- we never need to check distant pairs.
      #|
      #| Loop invariant: `closest_pair_prefix(xs, best, i)` asserts that for
      #| ALL pairs (j, k) with 0 <= j < k <= i, the gap at index `best` is minimal.
      #|
      #| Initialization: At i=1, best=0, the only pair is (0,1) and best=0
      #| points to it.
      #|
      #| Preservation: When we extend the prefix by one element (i -> i+1),
      #| any new pair involving xs[i+1] either:
      #|   1. Is the adjacent pair (i, i+1) -- directly compared with the current best
      #|   2. Spans a wider range [j, i+1] with j < i -- by sortedness, its gap is >=
      #|      the adjacent gap at (i, i+1), which is >= the best gap.
      #|
      #| Postcondition: The loop exits with i = length-1, so the prefix covers
      #| the entire array, yielding the global optimality guarantee.
    ),
  }
}
