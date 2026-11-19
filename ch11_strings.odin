package main

import "core:fmt"
import "core:mem/virtual"
import "core:strings"

strings_proc :: proc() {
	my_string: string
	my_string = "Hellope!"

	A_CONST :: "Hellope!"
	// does not work Gith non-constant strings
	my_string2 := A_CONST + " How are you?"

	fmt.println(my_string2)

	str := "hello, world!"
	for r in str {
		// r is of type rune
	}

	// slices by bytes which works for english, but not all characters (runes)
	str2 := "little cat!?"
	sub_str2 := str[7:11]
	fmt.println(sub_str2)

	//slice by rune indicies
	str3 := "小猫咪"
	sub_str3, _ := strings.substring_from(str3, 1)
	fmt.println(sub_str3) // 猫咪

	// with bytee index
	for r, i in str {
		fmt.println(i, r)
	}

	// construct strings with fmt package
	name := "Pontus"
	age := 7

	// t stands for temporary (uses the temp allocator)
	pontStr := fmt.tprint(name, "is", age) // pontus is 7.
	pontStr = fmt.tprint(name, "is", age, sep = " really ") // pontus is really is really 7.

	// aprint let's you choose your allocator
	pontStr = fmt.aprint(name, "is", age, allocator = context.temp_allocator)

	// there is also tprintf and aprintf (can use %v)
	// there is also println variants for all of them

	// stack allocated buffer with fmt.bprintf (fixed length of the len of buffer)
	buf: [128]byte
	pontStr = fmt.bprintf(buf[:], "%v is %v", name, age)

	// string builder (can pass different allocators )
	lines := []string{"I like", "I look for", "where are the"}
	b := strings.builder_make()

	for l, i in lines {
		strings.write_string(&b, l)
		if i != len(lines) - 1 {
			strings.write_string(&b, " cats.\n")
		} else {
			strings.write_string(&b, " cats?")
		}
	}

	str4 := strings.to_string(b)
	fmt.println(str4)
	strings.builder_destroy(&b)

	// string internals
	// Raw_String :: struct {
	// 	data: [^]u8,
	// 	len:  int,
	// }


	// free dynamically allocated strings with string arenas
	arena: virtual.Arena
	arena_allocator := virtual.arena_allocator(&arena)

	str_to_number: map[string]int

	str_to_number["Hellope!"] = 5
	str_to_number["Hi!"] = 1
	str_to_number[strings.clone("dynamically allocated!", arena_allocator)] = 7
	str_to_number["constant"] = 1
	str_to_number[strings.clone("dynamic!", arena_allocator)] = 7

	// Use str_to_number for something important
	virtual.arena_destroy(&arena)
	delete(str_to_number)

}
