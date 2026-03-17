///|
test "uniform gaps: returns first pair" {
  assert_eq(@closest_pair_sorted.closest_pair_sorted([1, 3, 5, 7]), 0)
}

///|
test "clear minimum in middle" {
  assert_eq(@closest_pair_sorted.closest_pair_sorted([1, 5, 6, 10]), 1)
}

///|
test "two elements: only one pair possible" {
  assert_eq(@closest_pair_sorted.closest_pair_sorted([1, 2]), 0)
}

///|
test "minimum gap at the end" {
  assert_eq(@closest_pair_sorted.closest_pair_sorted([1, 10, 20, 21]), 2)
}

///|
test "minimum gap at the start" {
  assert_eq(@closest_pair_sorted.closest_pair_sorted([1, 2, 10, 20]), 0)
}

///|
test "multiple ties: returns first minimum" {
  assert_eq(@closest_pair_sorted.closest_pair_sorted([1, 10, 11, 20, 21]), 1)
}

///|
test "consecutive integers: all gaps equal 1" {
  assert_eq(@closest_pair_sorted.closest_pair_sorted([5, 6, 7, 8, 9]), 0)
}
