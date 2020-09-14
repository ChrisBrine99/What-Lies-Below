/// @description Updates positions and checks for any collisions at said position. If there is a collision, 
/// movement is pixel-by-pixel until there is no space between the wall and entity.
/// @param destroyOnCollide

var _destroyOnCollide = argument0;

// Horizontal collision
var _hspd = sign(hspd);
if (place_meeting(x + hspd, y, par_wall)){
	// Move pixel-by-pixel until the wall is reached.
	while(!place_meeting(x + _hspd, y, par_wall)){
		x += _hspd;
	}
	isDestroyed = _destroyOnCollide;
	hspd = 0;
}
x += hspd;

// Vertical collision
var _vspd = sign(vspd);
if (place_meeting(x, y + vspd, par_wall)){
	// Move pixel-by-pixel until the wall is reached.
	while(!place_meeting(x, y + _vspd, par_wall)){
		y += _vspd;
	}
	isDestroyed = _destroyOnCollide;
	vspd = 0;
}
y += vspd;