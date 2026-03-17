///|
test "X outperforms Y" {
  // X profit=9 (buy 1 sell 10), Y profit=2 (buy 3 sell 5)
  assert_eq(@portfolio_digest.portfolio_best([1, 10, 5], [3, 5, 4]), 9)
}

///|
test "Y outperforms X" {
  assert_eq(@portfolio_digest.portfolio_best([5, 4, 3], [1, 1, 20]), 19)
}

///|
test "identical assets" {
  assert_eq(@portfolio_digest.portfolio_best([1, 5, 3, 8], [1, 5, 3, 8]), 7)
}

///|
test "both declining" {
  assert_eq(@portfolio_digest.portfolio_best([10, 8, 6], [9, 7, 5]), 0)
}

///|
test "anti-correlated assets" {
  assert_eq(@portfolio_digest.portfolio_best([1, 10, 1, 10], [10, 1, 10, 1]), 9)
}

///|
test "flat and volatile" {
  assert_eq(@portfolio_digest.portfolio_best([5, 5, 5, 5], [1, 10, 1, 10]), 9)
}

///|
test "two elements" {
  assert_eq(@portfolio_digest.portfolio_best([1, 2], [3, 1]), 1)
}

///|
test "negative prices" {
  assert_eq(@portfolio_digest.portfolio_best([-5, -1, -3], [-10, -2, -8]), 8)
}
