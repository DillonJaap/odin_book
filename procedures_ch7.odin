package main

import "core:fmt"

write_message :: proc(message: string, label: string = "Info") {
	if label != "" {
		fmt.print(label)
		fmt.print(": ")
	}
	fmt.println(message)
}

@(require_results)
divide_and_double :: proc(n: f32, d: f32) -> (res: f32, ok: bool) {
	(d == 0) or_return

	return (n / d) * 2, true
}

global_state: int
CONSTANT_NUMBER :: 7

do_stuff :: proc() {
	local_variable: int

	print_message :: proc(msg: string) {
		fmt.println(msg)
	}

	print_message("Hellope")
}

divide_numbers :: proc(n, d: f32) -> f32 {
	n := n
	n = n / d
	return n
}

increase_number :: proc(n: ^int, amount: int) {
	n^ += amount
}

CoolPerson :: struct {
	name:            string,
	health:          int,
	age:             int,
	number_of_teeth: int,
	height_inches:   f32,
}

// size of CoolPerson is greater than 16 bytes, therefore it gets passed as an immutable reference
print_person_info :: proc(p: CoolPerson) {
	fmt.println("%v is %v years old and has %v teeth.", p.name, p.age, p.number_of_teeth)
}


procdueres :: proc() {
	write_message("test")

	#force_inline write_message("test", "hello")
	write_message("test", label = "hello")

	do_stuff()

	new_num := divide_and_double(50, 60) or_else 50
}
