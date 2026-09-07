///|
/// Markov's Inequality: t * count(xs[i] >= t) <= Σ xs[i]
///
/// A fundamental probability inequality. Returns sum - t*count,
/// proving >= 0. The invariant t*count <= sum is maintained because:
///   if xs[i] >= t: t*(count+1) = t*count + t <= sum + xs[i]  ✓
///   if xs[i] < t:  t*count <= sum <= sum + xs[i]  ✓
pub fn markov(
  xs : FixedArray[Int],
  t : Int,
) -> Int where {
  proof_require: all_nonneg(xs),
  proof_require: pos_t(t),
  proof_ensure: result => markov_ok(result),
} {
  for i = 0, sum = 0, count = 0; i < xs.length(); {
    let new_sum = sum + xs[i]
    let new_count = if xs[i] >= t { count + 1 } else { count }
    continue i + 1, new_sum, new_count
  } nobreak {
    sum - t * count
  } where {
    proof_invariant: 0 <= i,
    proof_invariant: i <= xs.length(),
    proof_invariant: sum >= 0,
    proof_invariant: count >= 0,
    proof_invariant: t * count <= sum,
  }
}
