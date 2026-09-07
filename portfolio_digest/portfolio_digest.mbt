///|
/// Dual-Asset Portfolio Digest
///
/// Analyzes two asset price series simultaneously in a single O(n) pass,
/// proving cross-asset optimality. Tracks NINE state variables through
/// EIGHTEEN loop invariants combining:
///
///   1. Independent min/max tracking for each asset (4 universally quantified)
///   2. Independent profit optimality for each asset (2 doubly quantified)
///   3. Profit bounded by range for each asset (2 cross-technique)
///   4. Spread total variation between the two assets
///   5. Spread triangle inequality (TV dominates telescoping spread)
///
/// Returns the best profit across BOTH assets. The postcondition is
/// doubly quantified over ALL buy-sell pairs in BOTH arrays simultaneously:
///   result >= xs[k] - xs[j] AND result >= ys[k] - ys[j] for all j <= k.
///
/// This proves that a single O(n) pass finds the globally optimal trade
/// across an entire two-asset portfolio.
pub fn portfolio_best(
  xs : FixedArray[Int],
  ys : FixedArray[Int],
) -> Int where {
  proof_require: same_length(xs, ys),
  proof_require: at_least_two(xs),
  proof_ensure: result => portfolio_ok(xs, ys, result),
} {
  for i = 1, min_x = xs[0], max_x = xs[0], profit_x = 0, min_y = ys[0], max_y = ys[0], profit_y = 0, spread_tv = 0, spread_sum = 0; i <
     xs.length(); {
    // ── Asset X: price extremes ─────────────────────────────────
    let new_min_x = if xs[i] < min_x { xs[i] } else { min_x }
    let new_max_x = if xs[i] > max_x { xs[i] } else { max_x }

    // ── Asset X: optimal profit ─────────────────────────────────
    let cur_px = xs[i] - min_x
    let new_profit_x = if cur_px > profit_x { cur_px } else { profit_x }

    // ── Asset Y: price extremes ─────────────────────────────────
    let new_min_y = if ys[i] < min_y { ys[i] } else { min_y }
    let new_max_y = if ys[i] > max_y { ys[i] } else { max_y }

    // ── Asset Y: optimal profit ─────────────────────────────────
    let cur_py = ys[i] - min_y
    let new_profit_y = if cur_py > profit_y { cur_py } else { profit_y }

    // ── Spread total variation ──────────────────────────────────
    let spread_d = xs[i] - ys[i] - (xs[i - 1] - ys[i - 1])
    let abs_sd = if spread_d >= 0 { spread_d } else { -spread_d }
    let new_stv = spread_tv + abs_sd
    let new_ss = spread_sum + spread_d

    continue i + 1,
      new_min_x,
      new_max_x,
      new_profit_x,
      new_min_y,
      new_max_y,
      new_profit_y,
      new_stv,
      new_ss
  } nobreak {
    if profit_x > profit_y {
      profit_x
    } else {
      profit_y
    }
  } where {
    // ── Index bounds ────────────────────────────────────────────
    proof_invariant: 1 <= i,
    proof_invariant: i <= xs.length(),

    // ── Asset X: min/max (universally quantified) ───────────────
    proof_invariant: min_prefix_x(xs, min_x, i),
    proof_invariant: max_prefix_x(xs, max_x, i),
    proof_invariant: max_x >= min_x,

    // ── Asset X: profit (doubly quantified) ─────────────────────
    proof_invariant: profit_x >= 0,
    proof_invariant: profit_optimal_x(xs, profit_x, i),
    proof_invariant: profit_x <= max_x - min_x,

    // ── Asset Y: min/max (universally quantified) ───────────────
    proof_invariant: min_prefix_y(ys, min_y, i),
    proof_invariant: max_prefix_y(ys, max_y, i),
    proof_invariant: max_y >= min_y,

    // ── Asset Y: profit (doubly quantified) ─────────────────────
    proof_invariant: profit_y >= 0,
    proof_invariant: profit_optimal_y(ys, profit_y, i),
    proof_invariant: profit_y <= max_y - min_y,

    // ── Spread analysis ─────────────────────────────────────────
    proof_invariant: spread_tv >= 0,
    proof_invariant: spread_sum == xs[i - 1] - ys[i - 1] - (xs[0] - ys[0]),
    proof_invariant: spread_tv >= spread_sum,
    proof_invariant: spread_tv >= -spread_sum,
    proof_reasoning: (
      #| Nine state variables analyze two assets and their spread simultaneously.
      #|
      #| ASSET X (min_x, max_x, profit_x): identical structure to maxprofit.
      #|   profit_optimal_x is doubly quantified: profit_x >= xs[k]-xs[j] for all j<=k.
      #|   profit_x <= max_x-min_x links profit to the price range.
      #|
      #| ASSET Y (min_y, max_y, profit_y): mirror of Asset X on the second array.
      #|   Independent tracking with its own universally quantified bounds.
      #|
      #| SPREAD ANALYSIS (spread_tv, spread_sum): total variation of the
      #|   inter-asset spread xs[i]-ys[i]. The telescoping sum gives
      #|   spread_sum = (xs[i-1]-ys[i-1]) - (xs[0]-ys[0]), and the triangle
      #|   inequality ensures spread_tv >= |spread_sum|. This measures
      #|   basis risk between the two assets.
      #|
      #| POSTCONDITION: returns max(profit_x, profit_y). The doubly-quantified
      #|   postcondition covers BOTH arrays: for all j<=k, the result exceeds
      #|   both xs[k]-xs[j] AND ys[k]-ys[j]. Proven by case split on
      #|   which profit is larger.
    ),
  }
}
