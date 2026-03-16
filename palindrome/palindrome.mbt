///|
/// Palindrome check: if result == 1, then xs[k] == xs[n-1-k] for all k
///
/// Combines boolean-∀ bridge with reverse-index array arithmetic.
/// The quantifier body contains xs[xs.length()-1-k], requiring
/// Z3 to verify array bounds for the reversed index.
#ensures(palindrome_ok(xs, result))
pub fn is_palindrome(xs : FixedArray[Int]) -> Int {
  for i = 0, ok = 1; i < xs.length(); {
    let new_ok = if xs[i] == xs[xs.length() - 1 - i] { ok } else { 0 }
    continue i + 1, new_ok
  } nobreak {
    ok
  } where {
    invariant: 0 <= i,
    invariant: i <= xs.length(),
    invariant: ok == 0 || ok == 1,
    invariant: pal_upto(xs, ok, i),
  }
}
