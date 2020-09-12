/// @description FOR TESTING

draw_set_color(c_white);
draw_set_font(font_gui_xSmall);
draw_text(5, 5, "Delta Time: " + string(global.deltaTime));

with(cameraID){
	draw_text(5, 15, "Camera Position: (" + string(x) + ", " + string(y) + ")\n" +
					 "targetFraction: " + string(targetFraction));
}

with(obj_claire){
	draw_text(5, 40, "sprite_index: " + sprite_get_name(sprite_index) + "\nvisible: " + string(visible));
}