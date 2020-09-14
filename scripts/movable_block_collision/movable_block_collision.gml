

// Flag that determines if the state for moving an object should become active
var _collision = false;

// If the player is moving diagonally, don't even check for collision
if (inputDirection % 90 != 0){
	return;
}

// Horizontal collision
var _block = instance_place(x + hspd, y, par_wall);
if (_block != noone && _block.wallType == Wall.Movable){
	// Ensures that the player isn't pushing from the edges of the block
	if (bbox_top > _block.bbox_top && bbox_bottom < _block.bbox_bottom){
		_collision = true;
	}
}

// Vertical collision
if (_block == noone){ // If a wall on the x-axis hasn't been found; check for vertical
	_block = instance_place(x, y + vspd, par_wall);
	if (_block != noone && _block.wallType == Wall.Movable){
		// Ensures that the player isn't pushing from the edges of the block
		if (bbox_left > _block.bbox_left && bbox_right < _block.bbox_right){
			_collision = true;
		}
	}
}

// If a collision occured in either direction; change the state and begin pushing the block forward
if (_collision){
	pushedObjectID = _block;
	pushedDirection = inputDirection;
	// Change state to begin pushing the object forward
	set_cur_state(state_claire_entering_push);
}