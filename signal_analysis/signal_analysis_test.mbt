///|
test "constant signal: TV is zero" {
  assert_eq(@signal_analysis.signal_stats([5, 5, 5, 5]), 0)
}

///|
test "monotone increasing: TV equals endpoint difference" {
  assert_eq(@signal_analysis.signal_stats([1, 3, 6, 10]), 9)
}

///|
test "monotone decreasing: TV equals endpoint difference" {
  assert_eq(@signal_analysis.signal_stats([10, 6, 3, 1]), 9)
}

///|
test "oscillating signal: TV exceeds endpoint difference" {
  // changes: +5, -5, +5 => TV = 15, but xs[3]-xs[0] = 5
  assert_eq(@signal_analysis.signal_stats([0, 5, 0, 5]), 15)
}

///|
test "single step" {
  assert_eq(@signal_analysis.signal_stats([1, 100]), 99)
}

///|
test "V-shape: TV equals sum of both legs" {
  // down 5, up 8 => TV = 13
  assert_eq(@signal_analysis.signal_stats([10, 5, 13]), 13)
}

///|
test "large oscillation" {
  assert_eq(@signal_analysis.signal_stats([0, 100, 0, 100, 0]), 400)
}

///|
test "negative values" {
  // changes: |2|+|3|+|3|+|4| = 12
  assert_eq(@signal_analysis.signal_stats([-3, -1, -4, -1, -5]), 12)
}
