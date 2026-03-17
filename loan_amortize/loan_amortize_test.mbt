///|
test "zero-interest loan" {
  // 1000 principal, 0% rate, 100/period, 10 periods
  assert_eq(@loan_amortize.amortize(1000, 0, 100, 10), 1000)
}

///|
test "single period" {
  assert_eq(@loan_amortize.amortize(1000, 500, 1050, 1), 1050)
}

///|
test "zero periods" {
  assert_eq(@loan_amortize.amortize(1000, 500, 100, 0), 0)
}

///|
test "fully amortized small loan" {
  // 100 principal, 10% (1000 bps), payment 55, 2 periods
  // Period 1: interest = 100*1000/10000 = 10, principal = 45, balance = 55
  // Period 2: interest = 55*1000/10000 = 5, principal = 50, balance = 5
  assert_eq(@loan_amortize.amortize(100, 1000, 55, 2), 110)
}

///|
test "large payment clears quickly" {
  // Payment much larger than balance
  assert_eq(@loan_amortize.amortize(100, 500, 200, 3), 600)
}

///|
test "zero balance loan" {
  assert_eq(@loan_amortize.amortize(0, 500, 100, 5), 500)
}
