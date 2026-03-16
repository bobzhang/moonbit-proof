/// Index of minimum element (dual of maxarr)
///
/// Proves: ∀ k, xs[result] <= xs[k] AND 0 <= result < n
#requires(nonempty(xs))
#ensures(is_min_index(xs, result))
pub fn index_of_min(xs : FixedArray[Int]) -> Int {
  for i = 1, best = 0; i < xs.length(); {
    let new_best = if xs[i] < xs[best] { i } else { best }
    continue i + 1, new_best
  } nobreak {
    best
  } where {
    invariant: 1 <= i,
    invariant: i <= xs.length(),
    invariant: 0 <= best,
    invariant: best < i,
    invariant: min_in_prefix(xs, best, i),
  }
}
