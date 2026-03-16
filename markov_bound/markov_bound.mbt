///|
/// Markov's Inequality: t * count(xs[i] >= t) <= Σ xs[i]
///
/// A fundamental probability inequality. Returns sum - t*count,
/// proving >= 0. The invariant t*count <= sum is maintained because:
///   if xs[i] >= t: t*(count+1) = t*count + t <= sum + xs[i]  ✓
///   if xs[i] < t:  t*count <= sum <= sum + xs[i]  ✓
#requires(all_nonneg(xs))
#requires(pos_t(t))
#ensures(markov_ok(result))
pub fn markov(xs : FixedArray[Int], t : Int) -> Int {
  for i = 0, sum = 0, count = 0; i < xs.length(); {
    let new_sum = sum + xs[i]
    let new_count = if xs[i] >= t { count + 1 } else { count }
    continue i + 1, new_sum, new_count
  } nobreak {
    sum - t * count
  } where {
    invariant: 0 <= i,
    invariant: i <= xs.length(),
    invariant: sum >= 0,
    invariant: count >= 0,
    invariant: t * count <= sum,
  }
}
