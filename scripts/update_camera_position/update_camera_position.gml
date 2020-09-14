/// @description Updates the position of the camera used the currently desired movement method, whether that be
/// free and smooth movement while unlocked, or a locked-on movement with a deadzone in the center.

// FOR CUTSCENES -- Returns true if the unlocked camera movement reached its desired position
var _positionReached = false;

if (!newObjectSet && curObject != noone){ // Camera movement when locked onto an object
	var _newPosition = [0, 0];
	with(curObject){
		_newPosition[X] = x;
		_newPosition[Y] = y;
	}
	
	// Factors in the current offset of the camera shake to avoid any weird bugs with deadzone
	// boundaries.
	var _deadZone = deadZoneRadius;
	
	// Horizontal camera movement
	if (x < _newPosition[X] - _deadZone){ // Moving the camera to the left
		x = _newPosition[X] - _deadZone;
	} else if (x > _newPosition[X] + _deadZone){ // Moving the camera to the right
		x = _newPosition[X] + _deadZone;
	}
	// Vertical camera movement
	if (y < _newPosition[Y] - _deadZone){ // Moving the camera upward
		y = _newPosition[Y] - _deadZone;
	} else if (y > _newPosition[Y] + _deadZone){ // Moving the camera downward
		y = _newPosition[Y] + _deadZone;
	}
} else{ // Camera movement when unlocked or moving to followed object
	var _moveSpeed = moveSpeed * global.deltaTime;
	// Smooth horizontal movement
	targetFraction[X] += (targetPosition[X] - x) * _moveSpeed;
	if (abs(targetFraction[X]) >= 1){ // Prevents any half-pixel movement on the x-axis.
		var _amountToMove = floor(targetFraction[X]);
		targetFraction[X] -= _amountToMove;
		x += _amountToMove;
	}
	// Smooth vertical movement
	targetFraction[Y] += (targetPosition[Y] - y) * _moveSpeed;
	if (abs(targetFraction[Y]) >= 1){ // Prevents any half-pixel movement on the y-axis.
		var _amountToMove = floor(targetFraction[Y]);
		targetFraction[Y] -= _amountToMove;
		y += _amountToMove;
	}
	
	// Check if the camera has reached its final position. Reset fraction variables and lock position if so
	if (point_distance(x, y, targetPosition[X], targetPosition[Y]) < moveSpeed){
		x = targetPosition[X];
		y = targetPosition[Y];
		targetFraction = [0, 0];
		// Reset the flag for moving to a newly followed object to return to default movement
		if (curObject != noone){
			newObjectSet = false;
		}
		_positionReached = true;
	}
}

// After moving the camera to a new postiion; update the view matrix
camera_set_view_mat(cameraID, matrix_build_lookat(x, y, -10, x, y, 0, 0, 1, 0));

// Returns either true or false to let the cutscene know that the camera has reached its necessary
// position, which will allow the cutscene to move onto the next instruction
return _positionReached;