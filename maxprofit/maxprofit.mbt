///|
/// Best Time to Buy and Sell Stock
///
/// The classic interview problem: given daily prices, find the maximum profit
/// from a single buy-sell transaction (buy before sell). Tracks the running
/// minimum price and the best profit seen so far.
///
/// The postcondition uses a DOUBLY-QUANTIFIED universal statement: for ALL
/// pairs (j, k) with j <= k, the result is at least xs[k] - xs[j]. This
/// proves global optimality over every possible buy-sell pair in the array.
#requires(nonempty(xs))
#ensures(maxprofit_ok(xs, result))
pub fn max_profit(xs : FixedArray[Int]) -> Int {
  for i = 1, min_price = xs[0], profit = 0; i < xs.length(); {
    let new_min = if xs[i] < min_price { xs[i] } else { min_price }
    let cur_profit = xs[i] - min_price
    let new_profit = if cur_profit > profit { cur_profit } else { profit }
    continue i + 1, new_min, new_profit
  } nobreak {
    profit
  } where {
    invariant: 1 <= i,
    invariant: i <= xs.length(),
    invariant: profit >= 0,
    invariant: min_in_prefix(xs, min_price, i),
    invariant: profit_optimal(xs, profit, i),
    reasoning: (
      #| Two invariants work together:
      #|   1. min_in_prefix: min_price <= xs[k] for all k < i (running minimum)
      #|   2. profit_optimal: profit >= xs[k] - xs[j] for all j <= k < i
      #|
      #| Initialization: i=1, min_price=xs[0], profit=0.
      #|   min_in_prefix holds: xs[0] <= xs[0].
      #|   profit_optimal holds: only pair is (0,0), profit=0 >= xs[0]-xs[0]=0.
      #|
      #| Preservation when processing xs[i]:
      #|   new_min = min(min_price, xs[i]). Clearly <= xs[k] for all k <= i.
      #|   cur_profit = xs[i] - min_price.
      #|   new_profit = max(profit, cur_profit).
      #|
      #|   For OLD pairs (j <= k < i): profit >= xs[k]-xs[j] by old invariant,
      #|   and new_profit >= profit, so new_profit >= xs[k]-xs[j].
      #|
      #|   For NEW pairs (k = i): need new_profit >= xs[i] - xs[j] for all j <= i.
      #|   Since min_price <= xs[j] (by min_in_prefix), we have:
      #|     cur_profit = xs[i] - min_price >= xs[i] - xs[j].
      #|   And new_profit >= cur_profit, so new_profit >= xs[i] - xs[j].
      #|
      #| Postcondition: When i = length, profit_optimal covers all pairs.
    ),
  }
}
