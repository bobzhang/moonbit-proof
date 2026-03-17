///|
test "unique closest in middle of unsorted array" {
  assert_eq(@find_closest.find_closest([1, 10, 7, 20, 3], 8), 2)
}

///|
test "exact match" {
  assert_eq(@find_closest.find_closest([10, 20, 30], 20), 1)
}

///|
test "single element" {
  assert_eq(@find_closest.find_closest([42], 100), 0)
}

///|
test "closest at start" {
  assert_eq(@find_closest.find_closest([1, 10, 20, 30], 2), 0)
}

///|
test "closest at end" {
  assert_eq(@find_closest.find_closest([1, 10, 20, 29], 30), 3)
}

///|
test "equidistant: first occurrence wins" {
  assert_eq(@find_closest.find_closest([1, 3], 2), 0)
}

///|
test "all elements equal to target" {
  assert_eq(@find_closest.find_closest([5, 5, 5], 5), 0)
}

///|
test "negative target" {
  assert_eq(@find_closest.find_closest([3, -1, 7, -5], -2), 1)
}
