/// Maximum single-transaction profit (best buy-sell pair)
///
/// Proves: result >= xs[k] - xs[j] for ALL j <= k (result is optimal)
///
/// The classic "best time to buy and sell stock" problem. Tracks the
/// running minimum price and the best profit seen so far.
///
/// This uses a DOUBLY-QUANTIFIED postcondition (∀j, ∀k), making it
/// one of the hardest proofs. The loop invariant maintains:
///   1. min_price <= xs[j] for all j < i (running minimum)
///   2. profit >= xs[k] - xs[j] for all j <= k < i (optimality)
///
/// Preservation when processing xs[i]:
///   new_profit = max(profit, xs[i] - min_price)
///   For old pairs (k < i): profit >= xs[k]-xs[j], new_profit >= profit
///   For new pairs (k = i): xs[i]-min_price >= xs[i]-xs[j] since min <= xs[j]
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
  }
}
