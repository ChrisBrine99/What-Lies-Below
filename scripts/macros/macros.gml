/// @description Stores all of the macro values referenced throughout the code.

// Global object depth and entity depth
#macro	GLOBAL_DEPTH				5
#macro	ENTITY_DEPTH				300

// In-game tile width/height in pixels
#macro	TILE_SIZE					16

// Possible aspect ratios and their in-game resolutions
#macro	FOUR_BY_THREE				[240, 180]
#macro	SIXTEEN_BY_NINE				[320, 180]
#macro	SIXTEEN_BY_TEN				[320, 200]
#macro	TWENTYONE_BY_NINE			[420, 180]

// Vector array indexes
#macro	X							0
#macro	Y							1

// Animation contants
#macro	DIRECTIONS					4
#macro	ANIMATION_FPS				60

// Maximum player inventory size
#macro	INVENTORY_SIZE				24

// Player status condition constants (60 = One Second of Real-Time)
#macro	SANITY_TIMER				300
#macro	CONDITION_TIMER				150
#macro	MAX_SANITY_LEVEL			100
#macro	BLEED_DAMAGE				0.025	// 2.5%
#macro	INITIAL_POISON_DAMAGE		0.01	// 1.0%