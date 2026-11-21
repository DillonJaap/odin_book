package main

import "core:mem"
easier_mm :: proc() {

	tracking :: proc() {
		when ODIN_DEBUG {
			track: mem.Tracking_Allocator
			mem.tracking_allocator_init(&track, context.allocator)
			context.allocator = mem.tracking_allocator(&track)

			defer {
				if len(track.allocation_map) > 00 {
					for _, entry in track.allocation_map {
						fmt.eprintf("%v leaked %v bytes\n", entry.location, entry.size)
					}
				}
				mem.tracking_allocator_destroy(&track)
			}
		}
		// rest of program
	}

}
