///|
/// Integer fourth root via binary search:
///   r⁴ <= n < (r+1)⁴
///
/// This is the quartic analogue of `isqrt` and `cubicroot`.
pub fn iroot4(
  n : Int,
) -> Int where {
  proof_require: nonneg(n),
  proof_ensure: result => fourth_root_ok(n, result),
} {
  for lo = 0, hi = n + 1; lo < hi - 1; {
    let mid = lo + (hi - lo) / 2
    if mid * mid * mid * mid <= n {
      continue mid, hi
    } else {
      continue lo, mid
    }
  } nobreak {
    lo
  } where {
    proof_invariant: 0 <= lo,
    proof_invariant: lo < hi,
    proof_invariant: lo * lo * lo * lo <= n,
    proof_invariant: n < hi * hi * hi * hi,
  }
}
