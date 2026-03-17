///|
test "identical arrays: gap is zero" {
  assert_eq(@paired_analysis.paired_gap([1, 2, 3], [1, 2, 3]), 0)
}

///|
test "uniform dominance" {
  assert_eq(@paired_analysis.paired_gap([1, 2, 3], [4, 5, 6]), 9)
}

///|
test "tight pointwise bound" {
  assert_eq(@paired_analysis.paired_gap([0, 0, 0], [1, 1, 1]), 3)
}

///|
test "varying gaps" {
  assert_eq(@paired_analysis.paired_gap([1, 5, 3], [2, 10, 3]), 6)
}

///|
test "single element" {
  assert_eq(@paired_analysis.paired_gap([0], [100]), 100)
}

///|
test "negative values with dominance" {
  assert_eq(@paired_analysis.paired_gap([-5, -3, -1], [-2, -1, 0]), 6)
}

///|
test "zero gap everywhere" {
  assert_eq(@paired_analysis.paired_gap([7, 7, 7], [7, 7, 7]), 0)
}
