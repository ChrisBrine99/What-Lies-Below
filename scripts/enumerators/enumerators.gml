/// @description Enumerators used by the game's various systems.

// Stores the state of the game on a global scale at the given moment
enum GameState{
	InGame,
	InMenu,
	Paused,
}

// An enumerator for storing the array indexes for each respective game setting
enum Settings{
	// Video Settings //
	AspectRatio,
	WindowScale,
	FullScreen,
	Bloom,
	ChromaticAberration,
	FilmGrain,
	Scanlines,
	// Audio Settings //
	Master,
	Sounds,
	Music,
	EnableMusic,
	// Keyboard Settings //
	GameRight,		// In-Game Keybindings
	GameLeft,
	GameUp,
	GameDown,
	Interact,
	Flashlight,
	ReadyWeapon,
	Reload,
	ChangeAmmo,
	MenuDown,
	MenuUp,			// Menu Keybindings
	MenuLeft,
	MenuRight,
	Select,
	Return,
	FileDelete,
	InvLeft,
	InvRight,
	// Accessibility Settings //
	ObjectiveHints,
	InteractableOutlining,
	TextSpeed,
	// Holds Total Number of Settings //
	Length,
}


enum Wall{
	Solid,
	Destructible,
	Movable,
}