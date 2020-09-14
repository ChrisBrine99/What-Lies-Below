/// @descriptionSets the target position for an unlocked camera to move to. This is useful during cutscenes 
/// since the camera is unlocked during them.
/// @param targetX
/// @param targetY

var _targetX, _targetY;
_targetX = argument0;
_targetY = argument1;

with(global.controllerID){
	targetPosition[X] = _targetX;
	targetPosition[Y] = _targetY;
}