///|
test "sum of 0 terms is 0" {
  assert_eq(@gauss.sum_to(0), 0)
}

///|
test "sum of first 1 natural number" {
  assert_eq(@gauss.sum_to(1), 1)
}

///|
test "sum 1+2+...+5 = 15" {
  assert_eq(@gauss.sum_to(5), 15)
}

///|
test "sum 1+2+...+10 = 55" {
  assert_eq(@gauss.sum_to(10), 55)
}

///|
test "sum 1+2+...+100 = 5050 (Gauss's classroom problem)" {
  assert_eq(@gauss.sum_to(100), 5050)
}
