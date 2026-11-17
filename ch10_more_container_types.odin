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

	// maps
	age_by_name: map[string]int

	age_by_name["Karl"] = 35
	age_by_name["Klucke"] = 7
	delete_key(age_by_name, "Klucke")

	karls_age := age_by_name["Karl"]
	my_age := age_by_name

	if karls_age, ok := age_by_name["Karl"]; ok {
		// foo
	}

	has_karl := "Karl" in age_by_name
	does_not_have_klucker := "Klucke" not_in age_by_name

	// alt allocator for map
	age_by_name := make(map[string]int, context.temp_allocator)

	for key, value in some_map {
		// foo
	}

	for key, &value in some_map {

	}

	set_of_names: [string]struct {}

	// add to set
	set_of_names["Pontus"] = {}

	// Check if set contains "Pontus"
	if "Pontus" in set_of_names {
		// ...
	}


	delete_key(&set_of_names, "Pontus")
}
