///|
/// Triangle Inequality for Hamming Distance
///
/// Proves that the Hamming distance satisfies the triangle inequality:
///   d(a, c) <= d(a, b) + d(b, c)
///
/// The function computes d(a,b) + d(b,c) - d(a,c) and proves the result
/// is non-negative. Hamming distance counts positions where two sequences
/// differ, and the triangle inequality is the foundational property that
/// makes it a valid metric — essential for error-correcting codes, nearest-
/// neighbor search, and DNA sequence analysis.
pub fn hamming_triangle_gap(
  a : FixedArray[Int],
  b : FixedArray[Int],
  c : FixedArray[Int],
) -> Int where {
  proof_require: same_length(a, b, c),
  proof_ensure: result => nonneg(result),
} {
  for i = 0, dab = 0, dbc = 0, dac = 0; i < a.length(); {
    let delta_ab = if a[i] == b[i] { 0 } else { 1 }
    let delta_bc = if b[i] == c[i] { 0 } else { 1 }
    let delta_ac = if a[i] == c[i] { 0 } else { 1 }
    continue i + 1, dab + delta_ab, dbc + delta_bc, dac + delta_ac
  } nobreak {
    dab + dbc - dac
  } where {
    proof_invariant: 0 <= i,
    proof_invariant: i <= a.length(),
    proof_invariant: dab >= 0,
    proof_invariant: dbc >= 0,
    proof_invariant: dac >= 0,
    proof_invariant: dab + dbc >= dac,
    proof_reasoning: (
      #| At each position i, we compare three values a[i], b[i], c[i] and
      #| compute whether each pair matches or differs. The key insight:
      #| at EVERY position, delta_ab + delta_bc >= delta_ac.
      #|
      #| Case analysis (verified automatically by the SMT solver):
      #|   - a[i]=b[i]=c[i]: 0+0 >= 0
      #|   - a[i]=b[i], b[i]!=c[i]: 0+1 >= 1 (a[i]!=c[i] by transitivity)
      #|   - a[i]!=b[i], b[i]=c[i]: 1+0 >= 1 (a[i]!=c[i] by transitivity)
      #|   - a[i]!=b[i], b[i]!=c[i], a[i]=c[i]: 1+1 >= 0
      #|   - a[i]!=b[i], b[i]!=c[i], a[i]!=c[i]: 1+1 >= 1
      #|
      #| Since the gap dab+dbc-dac starts at 0 and can only stay the same
      #| or increase at each step, it remains non-negative throughout.
    ),
  }
}
