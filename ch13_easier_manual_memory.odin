package main

import "core:fmt"
import "core:mem"
import vmem "core:mem/virtual"

easier_mm :: proc() {

	tracking :: proc() {
		when ODIN_DEBUG {
			track: mem.Tracking_Allocator
			mem.tracking_allocator_init(&track, context.allocator)
			context.allocator = mem.tracking_allocator(&track)

			defer {
				if len(track.allocation_map) > 0 {
					for _, entry in track.allocation_map {
						fmt.eprintf("%v leaked %v bytes\n", entry.location, entry.size)
					}
				}
				mem.tracking_allocator_destroy(&track)
			}
		}
		// rest of program
		ints := make([]int, 4096)
	}
	tracking()

	// traking alloc will print the caller rather than the new() call in the function
	allocate_7 :: proc(loc := #caller_location) -> ^int {
		number := new(int, loc = loc)
		number^ = 7
		return number
	}

	// growing virtual memory arena
	// Level :: struct {
	// 	name:    string,
	// 	objects: []Game_Object,
	// 	tiles:   []Tiles,
	// 	arena:   vmem.Arena,
	// }
	//
	// generate_level :: proc(name: string) -> Level {
	// 	level_arena: vmem.Arena
	// 	arena_allocator := vmem.arena_allocator(&level_arena)
	//
	// 	tiles := generate_tiles(arena_allocator)
	// 	objects := generate_objects(tiles, arena_allocator)
	//
	// 	return {
	// 		name = strings.clone(name, arena_allocator),
	// 		objects = objects,
	// 		tiles = tiles,
	// 		arena = level_arena,
	// 	}
	// }
	//
	// destroy_level :: proc(level: ^Level) {
	// 	vmem.arena_destroy(&level.arena)
	// }
}
