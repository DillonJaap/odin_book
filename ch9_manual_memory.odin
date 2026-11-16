package main

import "core:fmt"
import "core:math/rand"

Cat :: struct {
	age:  int,
	name: string,
}

make_cat :: proc(name: string, age: int) -> ^Cat {
	cat := new(Cat)
	cat^ = {
		name = name,
		age  = age,
	}
	return cat
}

cat_simulation :: proc() {
	cat := make_cat("Fluffy", 12)
	defer free(cat)
}

manual :: proc() {
	dynarr: [dynamic]int
	defer delete(dynarr)
	append(&dynarr, 5)
	fmt.println(len(dynarr))
	fmt.println(cap(dynarr))
	unordered_remove(&dynarr, 0)
	ordered_remove(&dynarr, 0)
	//always use unordered unless order matters
	//shrink() will reallocate to a smaller capacity

	// preallocate dynamic arrays
	pre_arr := make([dynamic]int, 0, 20)
	// len and cap
	pre_arr2 := make([dynamic]int, 20)

	// dynamically allocated vars
	number := new(f32)
	defer free(number)

	// temp allocator
	great_algorithm :: proc() {
		numbers := make([dynamic]int, context.temp_allocator)

		for i in 0 ..< 100 {
			append(&numbers, rand.int_max(1000))
		}

		for n in numbers {
			if n > 500 {
				fmt.println(n)
			}
		}
	}
	free_all(context.temp_allocator)

