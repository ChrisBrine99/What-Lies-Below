/// @description The default method for animating an entity. It takes in the sprite's speed that can be set 
/// within the sprite editor and calculates how fast the animation will play based on that value.

var _cardinalDirection, _totalFrames;
_cardinalDirection = round(direction / 90);
_totalFrames = sprite_get_number(sprite_index) / DIRECTIONS;

// Sets the entity's animation frame (image_index) to be equal to the current offset frame relative to the
// current direction that the entity is facing in. For example, if the player is facing to the right, the
// _cardinalDirection variable will equal 0 and will provide no offset for the animation. It would look 
// like this:
//
//				image_index = _localFrame + (0 * _totalFrames)
//
// The same idea applies to each direction. (0 = Right, 1 = Up, 2 = Left, 3 = Down)
image_index = localFrame + (_cardinalDirection * _totalFrames);
localFrame += (image_speed / ANIMATION_FPS) * global.deltaTime;

if (localFrame >= _totalFrames){ // The animation is at the end
	animationEnd = true;
	localFrame = 0;
} else{ // Reset animation flag
	animationEnd = false;
}