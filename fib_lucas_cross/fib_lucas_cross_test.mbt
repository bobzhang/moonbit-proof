///|
test "n=0: L(0)²-5F(0)² = 4-0 = 4" {
  assert_eq(@fib_lucas_cross.fib_lucas(0), 4)
}

///|
test "n=1: L(1)²-5F(1)² = 1-5 = -4" {
  assert_eq(@fib_lucas_cross.fib_lucas(1), -4)
}

///|
test "n=2: L(2)²-5F(2)² = 9-5 = 4" {
  assert_eq(@fib_lucas_cross.fib_lucas(2), 4)
}

///|
test "n=3: L(3)²-5F(3)² = 16-20 = -4" {
  assert_eq(@fib_lucas_cross.fib_lucas(3), -4)
}

///|
test "n=5: alternation continues" {
  assert_eq(@fib_lucas_cross.fib_lucas(5), -4)
}

///|
test "n=10: result squared is always 16" {
  assert_eq(@fib_lucas_cross.fib_lucas(10) * @fib_lucas_cross.fib_lucas(10), 16)
}
