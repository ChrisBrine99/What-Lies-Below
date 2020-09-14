/// @description Sets the constant initial hspd and vspd to new values, with an optional argument that overwrites 
/// the current maximum values being used by the entity to the new constant values.
/// @param maxHspd
/// @param maxVspd
/// @param overwriteCurrent

var _maxHspd, _maxVspd, _overwriteCurrent;
_maxHspd = argument0;
_maxVspd = argument1;
_overwriteCurrent = argument2;

maxHspdConst = max(0, _maxHspd);
maxVspdConst = max(0, _maxVspd);
if (_overwriteCurrent){
	reset_move_speed();
}