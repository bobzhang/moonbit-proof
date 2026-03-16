///|
/// Integer fourth root via binary search:
///   r⁴ <= n < (r+1)⁴
///
/// This is the quartic analogue of `isqrt` and `cubicroot`.
#requires(nonneg(n))
#ensures(fourth_root_ok(n, result))
pub fn iroot4(n : Int) -> Int {
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
    invariant: 0 <= lo,
    invariant: lo < hi,
    invariant: lo * lo * lo * lo <= n,
    invariant: n < hi * hi * hi * hi,
  }
}
