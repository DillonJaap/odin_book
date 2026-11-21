package main

import "base:runtime"
import "core:fmt"
import "core:log"
import "core:os"
implicit_context :: proc() {

	do_work :: proc() {
		make_lots_of_ints :: proc() -> []int {
			ints := make([]int, 4096)

			for &v, idx in ints {
				v = idx * 4
			}

			return ints
		}

		// make will use context.temp_allocator
		context.allocator = context.temp_allocator
		my_ints := make_lots_of_ints()

		// can also have allocator as a parameter with a default allocator (generally recomended)
	}

	assert_fail :: proc(prefix, message: string, loc := #caller_location) -> ! {
		fmt.printfln("Oh no, an assertion at line: %v", loc)
		fmt.println(message)
		runtime.trap()
	}

	context.assertion_failure_proc = assert_fail
	number := 5
	// assert(number == 7, "Number has wrong value")

	log_test :: proc() {
		context.logger = log.create_console_logger()

		log.info("Program Started")

		log.destroy_console_logger(context.logger)
	}

	log_to_file :: proc() {
		logh, logh_err := os.open("log.txt", {.Create, .Trunc, .Read, .Write})

		if logh_err == os.ERROR_NONE {
			os.stdout = logh
			os.stderr = logh
		}

		logger :=
			logh_err == os.ERROR_NONE ? log.create_file_logger(logh) : log.create_console_logger()

		context.logger = logger

		// Rest of program goes here, it will
		// use `context.logger` whenever you
		// run `log.info`, `log.error` etc.
		//
		// Also, fmt.println will be redirected
		// to the logger, due to the
		// `os.stdout = logh` lines above.
		// all_the_code_in_your_program()

		if logh_err == os.ERROR_NONE {
			log.destroy_file_logger(logger)
		} else {
			log.destroy_console_logger(logger)
		}

	}
}
