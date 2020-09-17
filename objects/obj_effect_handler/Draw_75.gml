/// @description Draw Screen-Space Effects

// The screen-space post processing effects are ordered as follows:
//		1	--		Film Grain/Noise Filter
//		2	--		Scanline Filter

// TODO -- Add check to see if noise filter is enabled
film_grain_effect();