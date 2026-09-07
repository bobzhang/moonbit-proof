///|
/// One-pass min/max gap:
/// returns `max(xs) - min(xs)` and proves it upper-bounds every pairwise
/// difference `xs[i] - xs[j]`.
pub fn minmax_gap(
  xs : FixedArray[Int],
) -> Int where {
  proof_require: nonempty(xs),
  proof_ensure: result => minmax_gap_ok(xs, result),
} {
  for i = 1, lo = xs[0], hi = xs[0]; i < xs.length(); {
    let new_lo = if xs[i] < lo { xs[i] } else { lo }
    let new_hi = if xs[i] > hi { xs[i] } else { hi }
    continue i + 1, new_lo, new_hi
  } nobreak {
    hi - lo
  } where {
    proof_invariant: 1 <= i,
    proof_invariant: i <= xs.length(),
    proof_invariant: lo_below_prefix(xs, lo, i),
    proof_invariant: hi_above_prefix(xs, hi, i),
    proof_invariant: lo <= hi,
  }
}
