///|
test "exact match returns its index" {
  assert_eq(@lowerbound.lower_bound([1, 3, 5, 7], 5), 2)
}

///|
test "between elements returns insertion point" {
  assert_eq(@lowerbound.lower_bound([1, 3, 5, 7], 4), 2)
}

///|
test "key smaller than all elements returns 0" {
  assert_eq(@lowerbound.lower_bound([1, 3, 5, 7], 0), 0)
}

///|
test "key larger than all elements returns length" {
  assert_eq(@lowerbound.lower_bound([1, 3, 5, 7], 8), 4)
}

///|
test "empty array returns 0" {
  assert_eq(@lowerbound.lower_bound([], 5), 0)
}

///|
test "duplicates: returns index of first occurrence" {
  assert_eq(@lowerbound.lower_bound([1, 3, 3, 3, 5], 3), 1)
}

///|
test "single element found" {
  assert_eq(@lowerbound.lower_bound([42], 42), 0)
}

///|
test "single element not found (key larger)" {
  assert_eq(@lowerbound.lower_bound([42], 50), 1)
}
