
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
	GameRight,
	GameLeft,
	GameUp,
	GameDown,
	Interact,
	Flashlight,
	ReadyWeapon,
	Reload,
	ChangeAmmo,
	// Accessibility Settings //
	InteractableOutlining,
	TextSpeed,
}


enum Wall{
	Solid,
	Destructible,
	Movable,
}