///|
test "classic stock: buy at 1, sell at 6" {
  assert_eq(@array_digest.digest([7, 1, 5, 3, 6, 4]), 5)
}

///|
test "declining: no profit" {
  assert_eq(@array_digest.digest([7, 6, 4, 3, 1]), 0)
}

///|
test "steady rise" {
  assert_eq(@array_digest.digest([1, 2, 3, 4, 5]), 4)
}

///|
test "V-shaped recovery" {
  assert_eq(@array_digest.digest([10, 3, 1, 8, 12]), 11)
}

///|
test "flat" {
  assert_eq(@array_digest.digest([5, 5, 5, 5]), 0)
}

///|
test "single large spike" {
  assert_eq(@array_digest.digest([1, 1, 1, 100, 1, 1]), 99)
}

///|
test "negative values" {
  assert_eq(@array_digest.digest([-5, -3, -10, -1, -7]), 9)
}

///|
test "two elements" {
  assert_eq(@array_digest.digest([1, 100]), 99)
}
