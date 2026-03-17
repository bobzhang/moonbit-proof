///|
test "classic stock example: buy at 1, sell at 6" {
  assert_eq(@market_analysis.analyze([7, 1, 5, 3, 6, 4]), 5)
}

///|
test "declining market: no profitable trade" {
  assert_eq(@market_analysis.analyze([7, 6, 4, 3, 1]), 0)
}

///|
test "steady rise: profit is last minus first" {
  assert_eq(@market_analysis.analyze([1, 2, 3, 4, 5]), 4)
}

///|
test "V-shaped recovery" {
  assert_eq(@market_analysis.analyze([10, 3, 1, 8, 12]), 11)
}

///|
test "flat market: zero profit" {
  assert_eq(@market_analysis.analyze([5, 5, 5, 5]), 0)
}

///|
test "two prices ascending" {
  assert_eq(@market_analysis.analyze([1, 100]), 99)
}

///|
test "best profit spans interior" {
  assert_eq(@market_analysis.analyze([3, 1, 4, 1, 5, 9, 2, 6]), 8)
}

///|
test "negative prices" {
  assert_eq(@market_analysis.analyze([-5, -3, -10, -1, -7]), 9)
}

///|
test "single large spike" {
  assert_eq(@market_analysis.analyze([1, 1, 1, 100, 1, 1]), 99)
}
