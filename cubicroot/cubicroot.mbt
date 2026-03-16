///|
/// Integer cube root via binary search: r³ <= n < (r+1)³
///
/// Extends isqrt to degree-3 polynomials. The binary search invariant
/// lo³ <= n < hi³, with the midpoint test being mid³ <= n.
///
/// Z3 must reason about CUBIC terms during both the midpoint test
/// and the search space narrowing — significantly harder than isqrt.
#requires(nonneg(n))
#ensures(cbrt_ok(n, result))
pub fn icbrt(n : Int) -> Int {
  for lo = 0, hi = n + 1; lo < hi - 1; {
    let mid = lo + (hi - lo) / 2
    if mid * mid * mid <= n {
      continue mid, hi
    } else {
      continue lo, mid
    }
  } nobreak {
    lo
  } where {
    invariant: 0 <= lo,
    invariant: lo < hi,
    invariant: lo * lo * lo <= n,
    invariant: n < hi * hi * hi,
  }
}
