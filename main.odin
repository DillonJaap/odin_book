package hellope

import "core:fmt"

is_bigger_than :: proc(number: int, compare_to: int) -> bool {
	return number > compare_to
}

main :: proc() {
	number: int
	number2 := 7
	decimal_number: f32

	CONSTANT_NUMBER :: 12
	number3 := CONSTANT_NUMBER

	// fixed arrays
	ten_ints: [10]int
	ten_ints2 := [10]int{1, 2, 3, 4, 5, 6, 7, 8, 9, 10}
	ten_ints[6] = 5

	for n in ten_ints {
		fmt.println(n)
	}

	#reverse for n in ten_ints {
		fmt.println(n)
	}

	for i in 0 ..< 10 {
		fmt.println(i)
	}

	fmt.println("Hellope!")
}
