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

Shape :: union #no_nil {
	Circle,
	Square,
}

Circle :: struct {
	radius: f32,
}

Square :: struct {
	width: f32,
}

Entity :: struct {
	position: [2]f32,
	// texture:  Texture,
	variant:  Entity_Variant,
}

Entity_Player :: struct {
	can_jump: bool,
}

Entity_Rocket :: struct {
	time_in_space: f32,
}

Entity_Variant :: union {
	Entity_Player,
	Entity_Rocket,
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

	switch v in val {
	case int:
	// v is an int
	case f32:
	// v is a f32
	case Person_Data:
	// v is a Person_Data
	case nil:
	}

	// modifiable
	switch &v in val {
	case int:
		v = 7
	case f32:
		v = 42
	case Person_Data:
		v.age = 7
	}

	if f32_val, f32_val_ok := val.(f32); f32_val_ok {
		// stuff
	}

	// mutable
	if f32_val, ok := &val.(f32); ok {
		f32_val^ = 7
	}

	shape: Shape

	switch s in shape {
	case Circle:
	// ok
	case Square:
	}

	time: Maybe(int)
	fmt.println(time)
	time = 5
	if time_val, ok := time.?; ok {
		// Use time_val.
	}
}

is_bigger_than :: proc(number: int, compare_to: int) -> bool {
	return number > compare_to
}
