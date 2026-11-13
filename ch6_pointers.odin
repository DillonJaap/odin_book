package main

import "core:fmt"

increment_number :: proc(num: ^int) {
	num^ += 1
}

pointers :: proc() {
	number := 7
	number_pointer := &number
	increment_number(number_pointer)
	fmt.println(number)
}
