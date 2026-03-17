///|
test "classic example: buy at 1, sell at 6" {
  assert_eq(@maxprofit.max_profit([7, 1, 5, 3, 6, 4]), 5)
}

///|
test "prices only decrease: no profit possible" {
  assert_eq(@maxprofit.max_profit([7, 6, 4, 3, 1]), 0)
}

///|
test "single price: no transaction" {
  assert_eq(@maxprofit.max_profit([5]), 0)
}

///|
test "two prices ascending: profit is the difference" {
  assert_eq(@maxprofit.max_profit([1, 2]), 1)
}

///|
test "two prices descending: no profit" {
  assert_eq(@maxprofit.max_profit([2, 1]), 0)
}

///|
test "best profit spans the full array" {
  assert_eq(@maxprofit.max_profit([3, 1, 4, 1, 5, 9]), 8)
}

///|
test "constant prices: zero profit" {
  assert_eq(@maxprofit.max_profit([5, 5, 5, 5]), 0)
}
