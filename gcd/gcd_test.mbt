///|
test "gcd of coprime numbers" {
  assert_eq(@gcd.gcd(3, 7), 1)
}

///|
test "gcd of equal numbers" {
  assert_eq(@gcd.gcd(12, 12), 12)
}

///|
test "gcd of multiples" {
  assert_eq(@gcd.gcd(12, 8), 4)
}

///|
test "gcd with one being multiple of other" {
  assert_eq(@gcd.gcd(15, 5), 5)
}

///|
test "classic example: gcd(48, 18) = 6" {
  assert_eq(@gcd.gcd(48, 18), 6)
}

///|
test "gcd(1, n) = 1" {
  assert_eq(@gcd.gcd(1, 100), 1)
}

///|
test "large coprime pair" {
  assert_eq(@gcd.gcd(97, 89), 1)
}

///|
test "Fibonacci consecutive: gcd is 1" {
  assert_eq(@gcd.gcd(21, 13), 1)
}
