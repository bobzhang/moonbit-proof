///|
test "cassini(0) = -1: fib(0)*fib(2) - fib(1)² = 0*1 - 1 = -1" {
  assert_eq(@cassini.cassini(0), -1)
}

///|
test "cassini(1) = 1: fib(1)*fib(3) - fib(2)² = 1*2 - 1 = 1" {
  assert_eq(@cassini.cassini(1), 1)
}

///|
test "cassini(2) = -1: fib(2)*fib(4) - fib(3)² = 1*3 - 4 = -1" {
  assert_eq(@cassini.cassini(2), -1)
}

///|
test "cassini(3) = 1: fib(3)*fib(5) - fib(4)² = 2*5 - 9 = 1" {
  assert_eq(@cassini.cassini(3), 1)
}

///|
test "alternating sign pattern continues" {
  assert_eq(@cassini.cassini(4), -1)
  assert_eq(@cassini.cassini(5), 1)
  assert_eq(@cassini.cassini(6), -1)
  assert_eq(@cassini.cassini(7), 1)
}

///|
test "result squared is always 1 (encodes |result| = 1)" {
  assert_eq(@cassini.cassini(10) * @cassini.cassini(10), 1)
  assert_eq(@cassini.cassini(15) * @cassini.cassini(15), 1)
  assert_eq(@cassini.cassini(20) * @cassini.cassini(20), 1)
}
