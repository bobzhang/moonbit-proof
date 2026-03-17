///|
/// Gauss's Summation Formula
///
/// Computes the sum 1 + 2 + ... + n and proves it equals n*(n+1)/2.
///
/// Legend has it that young Gauss discovered this at age 10 by pairing terms:
/// (1+n) + (2+(n-1)) + ... — each pair sums to (n+1), and there are n/2 pairs.
#requires(nonneg(n))
#ensures(gauss_ok(n, result))
pub fn sum_to(n : Int) -> Int {
  for i = 0, sum = 0; i < n; {
    let new_sum = sum + i + 1
    continue i + 1, new_sum
  } nobreak {
    sum
  } where {
    invariant: 0 <= i,
    invariant: i <= n,
    invariant: sum * 2 == i * (i + 1),
    reasoning: (
      #| We accumulate the sum in a loop from i=0 to n, adding (i+1) at each step.
      #| The loop invariant `2*sum == i*(i+1)` captures the exact closed-form
      #| relationship at every iteration boundary.
      #|
      #| Initialization: Before the loop, i=0 and sum=0, so 2*0 == 0*1 = 0.
      #|
      #| Preservation: When we add (i+1) to sum, the new state satisfies:
      #|   2*(sum + i + 1) = 2*sum + 2*(i+1) = i*(i+1) + 2*(i+1) = (i+1)*(i+2)
      #| which is the invariant with i replaced by i+1. Pure polynomial algebra.
      #|
      #| Postcondition: The loop exits when i == n. The invariant gives
      #| 2*sum == n*(n+1), which is precisely the postcondition `gauss_ok(n, result)`.
    ),
  }
}
