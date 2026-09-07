///|
/// Palindrome check: if result == 1, then xs[k] == xs[n-1-k] for all k
///
/// Combines boolean-∀ bridge with reverse-index array arithmetic.
/// The quantifier body contains xs[xs.length()-1-k], requiring
/// Z3 to verify array bounds for the reversed index.
pub fn is_palindrome(
  xs : FixedArray[Int],
) -> Int where {
  proof_ensure: result => palindrome_ok(xs, result),
} {
  for i = 0, ok = 1; i < xs.length(); {
    let new_ok = if xs[i] == xs[xs.length() - 1 - i] { ok } else { 0 }
    continue i + 1, new_ok
  } nobreak {
    ok
  } where {
    proof_invariant: 0 <= i,
    proof_invariant: i <= xs.length(),
    proof_invariant: ok == 0 || ok == 1,
    proof_invariant: pal_upto(xs, ok, i),
  }
}
