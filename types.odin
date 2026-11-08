package main

import "core:fmt"

Rectangle :: struct {
	x:      f32,
	y:      f32,
	width:  f32,
	height: f32,
}

Person_Stats :: struct {
	health: int,
	age:    int,
}

Person :: struct {
	using stats: Person_Stats,
	name:        string,
}

Computer_Type :: enum {
	Laptop,
	Desktop,
	Mainframe,
}

My_Union :: union {
	f32,
	int,
	Person_Data,
}

Person_Data :: struct {
	health: int,
	age:    int,
}

types :: proc() {
	numbers := [10]int{6, 4, 7, 10, 1, -1, -9, 100, 1, 54}

	cmp := 6

	for n in numbers {
		if is_bigger_than(n, cmp) {
			fmt.printfln("%v is bigger than %v", n, cmp)
		}
	}

	rect: Rectangle
	rect2 := Rectangle {
		width  = 20,
		height = 10,
	}
	rect3 := Rectangle{20, 20, 200, 200}

	p := Person {
		stats = {health = 7},
		name = "Bob",
	}
	t := p.health // directly using

	ct: Computer_Type
	ct = .Mainframe

	switch ct {
	case .Laptop:
		fmt.println("laptop")
	case .Desktop:
		fmt.println("desktop")
	case .Mainframe:
		fmt.println("mainframe")
	}

	val: My_Union = int(12)
}

is_bigger_than :: proc(number: int, compare_to: int) -> bool {
	return number > compare_to
}
