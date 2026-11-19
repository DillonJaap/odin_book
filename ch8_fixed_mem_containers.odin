package main


import "core:fmt"

Vector3 :: [3]f32
fixed_array :: proc() {
	// fixed array
	some_ints: [7]int

	some_ints = {51, 21, 621, 1, 51, 7, 12}

	// make them all zero
	some_ints = {}
	some_ints2 := [3]int{12, 12, 12}
	for &v in some_ints2 {
		fmt.println(v)
	}
	// big_boy := [1_000_000]int{}
	// for &v in big_boy {
	// 	fmt.println(v)
	// }

	vector3 := [3]f32{1, 2, 3}
	// can use xyzw or rgba
	test3 := vector3.yx

	position1: Vector3 = {1, 2, 3}
	postition2: Vector3 = {3, 4, 5}
	p3 := position1 + postition2

	Nice_People :: enum {
		Bob,
		Klucke,
		Tim,
	}

	nice_rating := [Nice_People]int {
		.Bob    = 5,
		.Klucke = 7,
		.Tim    = 3,
	}

	bobs_niceness := nice_rating[.Bob]

	//fixed capacity dynamic array
	// arr: [dynamic; 1024]int
}
