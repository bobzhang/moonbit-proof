///|
/// Nearest Element Search (Unsorted Array)
///
/// Finds the index of the element closest to a given target in an unsorted
/// array. Unlike the sorted-array proofs (closest_key_sorted, etc.), this
/// works on ANY array — no sortedness precondition required.
///
/// The postcondition universally quantifies over ALL elements, proving that
/// no element in the entire array is closer to the target than the one at
/// the returned index. We use squared distance (a-b)² instead of |a-b|
/// because |a| ≤ |b| iff a² ≤ b², and squared distance avoids absolute-value
/// case splits in the invariant.
#requires(nonempty(xs))
#ensures(find_closest_ok(xs, target, result))
pub fn find_closest(xs : FixedArray[Int], target : Int) -> Int {
  for i = 1, best = 0; i < xs.length(); {
    let cur_sq = (xs[i] - target) * (xs[i] - target)
    let best_sq = (xs[best] - target) * (xs[best] - target)
    let new_best = if cur_sq < best_sq { i } else { best }
    continue i + 1, new_best
  } nobreak {
    best
  } where {
    invariant: 1 <= i,
    invariant: i <= xs.length(),
    invariant: 0 <= best,
    invariant: best < i,
    invariant: closest_in_prefix(xs, target, best, i),
    reasoning: (
      #| We scan left to right, tracking the index `best` with minimum
      #| squared distance to `target` in the prefix xs[0..i).
      #|
      #| Squared distance (a-b)² is used instead of absolute distance |a-b|.
      #| Since |a| <= |b| iff a² <= b² for integers, the orderings are
      #| equivalent, but squaring avoids branching in the invariant.
      #|
      #| Initialization: At i=1, best=0. The single-element prefix has
      #| xs[0] as the trivially closest element.
      #|
      #| Preservation: Compare (xs[i]-target)² with (xs[best]-target)²:
      #|   - If cur_sq < best_sq: set best=i. For k < i, the old invariant
      #|     gives (xs[old_best]-target)² <= (xs[k]-target)², and cur_sq <
      #|     best_sq, so (xs[i]-target)² < (xs[k]-target)². For k=i: trivial.
      #|   - Otherwise: keep best. Old invariant covers k < i, and
      #|     best_sq <= cur_sq covers k=i.
      #|
      #| Postcondition: When i = length, the prefix is the whole array.
    ),
  }
}
