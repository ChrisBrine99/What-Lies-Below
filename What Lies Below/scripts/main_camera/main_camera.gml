// @description A lightweight object that contains all the information about the game's main camera. It can 
// be moved to target positions within the current room, or lock onto an object and follow that around.

function Camera() constructor{
	// Stores the center position of the camera's view.
	x = 0;
	y = 0;
	
	// Store the created camera's ID for easy reference.
	camera = -1;
	
	// Holds the target position to move to whenever the camera is unlocked and not following an object.
	// The fraction holds the values for the movement until it surpasses one, which will then add/subtract
	// a value of one to current camera position. The move speed determines how fast it will reach that position.
	targetPosition = [0, 0];
	targetFraction = [0, 0];
	moveSpeed = 0.25;
	
	// Holds the instance ID for the object being followed by the camera. The deadzone radius is the distance
	// from the center of the screen that the camera won't snap the the followed object's position.
	curObject = noone;
	deadZoneRadius = 8;
	
	// A flag that is set to true to move the camera to the newly set object's position without snapping.
	newObjectSet = false;
	
	// Updates the position of the camera used the currently desired movement method, whether that be
	// free and smooth movement while unlocked, or a locked-on movement with a deadzone in the center.
	static update_position = function(){
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
		camera_set_view_mat(camera, matrix_build_lookat(x, y, -10, x, y, 0, 0, 1, 0));
		
		// Returns either true or false to let the cutscene know that the camera has reached its necessary
		// position, which will allow the cutscene to move onto the next instruction
		return _positionReached;
	}
	
	// Creates the camera object that allows the game to be viewed through its window port. Otherwise,
	// the game would just be a black, empty square and that's no fun.
	static create_camera = function(_aspectRatio, _scale){
		if (camera == -1){ // Only create the camera if it doesn't current exist
			camera = camera_create();
			camera_set_view_mat(camera, matrix_build_lookat(x, y, -10, x, y, 0, 0, 1, 0));
			set_camera_aspect(_aspectRatio, _scale);
			enable_view();
		}
	}
	
	// Enables the use of views within the current room and sets the 0th view to be the camera object.
	static enable_view = function(){
		if (camera != -1){ // Only enable the view if a valid camera object exists
			view_enabled = true;
			view_camera[0] = camera;
			view_set_visible(0, true);
		}
	}
	
	// Sets the camera's aspect ratio to a new value depending on the aspect ratio provided. This adjusts
	// the in-game resolution to the new aspect, relative to around 180p.
	static set_camera_aspect = function(_aspectRatio, _scale){
		camera_set_view_size(camera, _aspectRatio[X], _aspectRatio[Y]);
		camera_set_proj_mat(camera, matrix_build_projection_ortho(_aspectRatio[X], _aspectRatio[Y], 1, 10000));
		surface_resize(application_surface, _aspectRatio[X], _aspectRatio[Y]);
		global.cameraSize = [_aspectRatio[X], _aspectRatio[Y]];
		set_window_size(_scale);
	}
	
	// Sets the window's size based on a scaling factor relative to its currently set aspect ratio.
	static set_window_size = function(_scale){
		var _windowDimensions = [camera_get_view_width(camera) * floor(_scale), camera_get_view_height(camera) * floor(_scale)];
		// After calculating the scale value for the window's dimensions, set the position and resize
		window_set_position(round((display_get_width() - _windowDimensions[X]) / 2), round((display_get_height() - _windowDimensions[Y]) / 2));
		window_set_size(_windowDimensions[X], _windowDimensions[Y]);
		// Finally, update the GUI scaling to match the window's new scale
		display_set_gui_maximize(_scale, _scale, 0, 0);
	}
	
	// Sets the curObject variable to the ID for the object the camera will follow. Instead of instantly 
	// locking on, however, the camera will instead set a flag that enabled the camera to smoothly reach 
	// whatever position the followed object is at before resetting to default movement.
	static set_cur_object = function(_objectID){
		set_target_position(_objectID.x, _objectID.y);
		curObject = _objectID;
		newObjectSet = true;
	}
	
	// Sets the target position for an unlocked camera to move to. This is useful during cutscenes since
	// the camera is unlocked during them.
	static set_target_position = function(_targetX, _targetY){
		targetPosition[X] = _targetX;
		targetPosition[Y] = _targetY;
	}
	
	// Sets the speed that the camera reaches its target position or followed object at in pixels per 1/60th
	// of a real-world second.
	static set_move_speed = function(_moveSpeed){
		moveSpeed = _moveSpeed;
	}
}