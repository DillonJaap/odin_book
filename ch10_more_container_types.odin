package main

containers :: proc() {
	// creating a slice
	my_numbers: [50]int
	first_20 := my_numbers[0:20]
	full_slice := my_numbers[:]

	// []int is a slice.
	// [50]int is a fixed array.
	// [dynamic]int is a dynamic array.

	dyn_arr: [dynamic]f32

	for i in 0 ..< 200 {
		append(&dyn_arr, f32(i * i))
	}

	half_dyn_arr_size := len(dyn_arr) / 2
	half_the_dyn_arr := dyn_arr[:half_dyn_arr_size]

	// slices with their own memory
	my_numbers: [128]int
	first_20 := my_numbers[:20]
	first_20_clone := slice.clone(first_20)
	// also works
	ints := make([]int, 128)
}
