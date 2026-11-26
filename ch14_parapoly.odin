package main

import "base:intrinsics"
parapoly :: proc() {
	clamp :: proc(val: f32, min: f32, max: f32) -> f32 {
		if val <= min {
			return min
		}

		if val >= max {
			return max
		}

		return val
	}

	clamp_poly :: proc(val: $T, min: T, max: T) -> T where intrinsics.type_is_numeric(T) {
		if val <= min {
			return min
		}

		if val >= max {
			return max
		}

		return val
	}


}
