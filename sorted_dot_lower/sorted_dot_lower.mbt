/// Sorted dot product excess: dot(xs,ys) - xs[0]*sum(ys) >= 0
///
/// If xs is sorted ascending and ys is non-negative, then
/// Σ xs[i]*ys[i] >= xs[0] * Σ ys[i] because xs[i] >= xs[0] for all i.
///
/// Combines: sorted precondition + nonlinear invariant + quantified nonneg.
/// The invariant dot - xs[0]*sumy >= 0 is maintained because:
///   (dot + xs[i]*ys[i]) - xs[0]*(sumy + ys[i])
///   = (dot - xs[0]*sumy) + (xs[i] - xs[0])*ys[i]
///   >= 0 + 0 = 0  (since xs[i] >= xs[0] and ys[i] >= 0)
#requires(sorted(xs))
#requires(same_length(xs, ys))
#requires(nonempty(xs))
#requires(all_nonneg(ys))
#ensures(dot_lower_ok(result))
pub fn sorted_dot_excess(xs : FixedArray[Int], ys : FixedArray[Int]) -> Int {
  for i = 0, dot = 0, sumy = 0; i < xs.length(); {
    let new_dot = dot + xs[i] * ys[i]
    let new_sumy = sumy + ys[i]
    continue i + 1, new_dot, new_sumy
  } nobreak {
    dot - xs[0] * sumy
  } where {
    invariant: 0 <= i,
    invariant: i <= xs.length(),
    invariant: sumy >= 0,
    invariant: dot - xs[0] * sumy >= 0,
  }
}
