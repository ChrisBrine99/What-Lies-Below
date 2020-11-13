/// @description Drawing Object Bounds

// Displays the edge of a given light source
with(obj_light){
	if (trueLight){ // Radii for lights that exist in the game world will be white
		draw_ellipse_color(x - radius[X], y - radius[Y], x + radius[X], y + radius[Y], c_white, c_white, true);
	} else{ // Radii for lights that assist the player will be a light gray
		draw_ellipse_color(x - radius[X], y - radius[Y], x + radius[X], y + radius[Y], c_ltgray, c_ltgray, true);
	}
}

// Displays the collision bounds for player interaction
with(par_interactable){
	draw_rect_outline(bbox_left, bbox_top, 1 + bbox_right - bbox_left, 1 + bbox_bottom - bbox_top, c_white, c_blue, 0, 1);
}

// Displays data relative to all entities; collision bounds, interaction point (Player only), etc.
with(par_entity){
	if (object_index == obj_claire){ // Display point that checks for interaction with other objects
		draw_point_color(x + lengthdir_x(6, direction), (y - 4) + lengthdir_y(6, direction), c_lime);
	}
	draw_rect_outline(bbox_left, bbox_top, 1 + bbox_right - bbox_left, 1 + bbox_bottom - bbox_top, c_white, c_gray, 0, 1);
}