///|
test "identical arrays: all distances zero" {
  assert_eq(
    @hamming_triangle.hamming_triangle_gap([1, 2, 3], [1, 2, 3], [1, 2, 3]),
    0,
  )
}

///|
test "tight inequality: gap is zero" {
  // a=[1,0,1], b=[0,0,1], c=[0,1,1]
  // d(a,b)=1, d(b,c)=1, d(a,c)=2 => gap=0
  assert_eq(
    @hamming_triangle.hamming_triangle_gap([1, 0, 1], [0, 0, 1], [0, 1, 1]),
    0,
  )
}

///|
test "all pairs differ: positive gap" {
  // d(a,b)=3, d(b,c)=3, d(a,c)=3 => gap=3
  assert_eq(
    @hamming_triangle.hamming_triangle_gap([1, 2, 3], [4, 5, 6], [7, 8, 9]),
    3,
  )
}

///|
test "a equals c: gap equals 2*d(a,b)" {
  // d(a,b)=3, d(b,c)=3, d(a,c)=0 => gap=6
  assert_eq(
    @hamming_triangle.hamming_triangle_gap([0, 0, 0], [1, 1, 1], [0, 0, 0]),
    6,
  )
}

///|
test "single element" {
  assert_eq(@hamming_triangle.hamming_triangle_gap([0], [0], [1]), 0)
}

///|
test "chain of single differences" {
  // d(a,b)=1, d(b,c)=1, d(a,c)=2 => gap=0
  assert_eq(@hamming_triangle.hamming_triangle_gap([1, 1], [1, 0], [0, 0]), 0)
}
