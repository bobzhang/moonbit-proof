///|
/// Strictly increasing check: if result == 1, all adjacent xs[k] < xs[k+1]
///
/// Strict variant of checksorted (<  instead of <=).
#ensures(strictly_increasing_ok(xs, result))
pub fn is_strictly_increasing(xs : FixedArray[Int]) -> Int {
  for i = 0, ok = 1; i < xs.length() - 1; {
    let new_ok = if xs[i] < xs[i + 1] { ok } else { 0 }
    continue i + 1, new_ok
  } nobreak {
    ok
  } where {
    invariant: 0 <= i,
    invariant: ok == 0 || ok == 1,
    invariant: strict_inc_upto(xs, ok, i + 1),
  }
}
