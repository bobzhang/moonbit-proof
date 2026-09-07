///|
/// Total variation bounds every pairwise difference in the array.
///
/// This strengthens the endpoint-only total variation proof by tracking the
/// full band of prefix displacements `xs[k] - xs[0]`. The width of that band is
/// always bounded by the running total variation, so at the end any difference
/// `xs[i] - xs[j]` is bounded by `tv`.
pub fn total_var_diameter(
  xs : FixedArray[Int],
) -> Int where {
  proof_require: nonempty(xs),
  proof_ensure: result => tv_diameter_ok(xs, result),
} {
  for i = 0, tv = 0, sum = 0, lo = 0, hi = 0; i < xs.length() - 1; {
    let d = xs[i + 1] - xs[i]
    let abs_d = if d >= 0 { d } else { -d }
    let new_sum = sum + d
    let new_lo = if new_sum < lo { new_sum } else { lo }
    let new_hi = if new_sum > hi { new_sum } else { hi }
    let new_tv = tv + abs_d
    continue i + 1, new_tv, new_sum, new_lo, new_hi
  } nobreak {
    tv
  } where {
    proof_invariant: 0 <= i,
    proof_invariant: i <= xs.length() - 1,
    proof_invariant: tv >= 0,
    proof_invariant: sum == xs[i] - xs[0],
    proof_invariant: lo <= sum,
    proof_invariant: sum <= hi,
    proof_invariant: hi - lo <= tv,
    proof_invariant: prefix_in_band(xs, lo, hi, i),
  }
}
