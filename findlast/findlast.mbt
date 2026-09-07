///|
/// Find last occurrence: returns the rightmost index where xs[i] == key
///
/// Proves: result == -1 or xs[result] == key,
///   AND no occurrence of key exists after result.
///
/// The invariant no_match_after tracks that between found and i,
/// there are no matches. This is harder than find-first because
/// the quantified property refers to a RANGE between two variables.
pub fn find_last(
  xs : FixedArray[Int],
  key : Int,
) -> Int where {
  proof_ensure: result => findlast_ok(xs, key, result),
} {
  for i = 0, found = -1; i < xs.length(); {
    let new_found = if xs[i] == key { i } else { found }
    continue i + 1, new_found
  } nobreak {
    found
  } where {
    proof_invariant: 0 <= i,
    proof_invariant: i <= xs.length(),
    proof_invariant: found == -1 ||
    (0 <= found && found < i && xs[found] == key),
    proof_invariant: no_match_after(xs, key, found, i),
  }
}
