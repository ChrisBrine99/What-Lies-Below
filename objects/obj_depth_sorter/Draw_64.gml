/// @description FOR DEBUGGING

draw_set_font(font_gui_xSmall);
draw_set_color(c_white);
with(global.controllerID){
	draw_text(5, 5, "Screen Center: (" + string(x) + ", " + string(y) + ")\n" +
					"Screen Bounds: (" + string(x - (global.cameraSize[X] / 2)) + ", " + string(y - (global.cameraSize[Y] / 2)) + ", " + string(x + (global.cameraSize[X] / 2)) + ", " + string(y + (global.cameraSize[Y] / 2)) + ")");
}

draw_text(5, 25, "Objects Drawn");
draw_text(80, 25, "--");

draw_set_color(c_red);
draw_text(100, 25, string(totalObjectsDrawn));