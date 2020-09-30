/// @description FOR DEBUGGING

/*shader_set(outlineShader);
shader_set_uniform_f_array(sOutlineColor, [0.5, 0.5, 0.5]);
shader_set_uniform_i(sDrawOutline, 1); // Make sure outline is enabled for text

draw_set_font(font_gui_xSmall);
outline_set_texel_size(font_get_texture(font_gui_xSmall), sPixelWidth, sPixelHeight);

draw_set_color(c_white);
with(global.controllerID){
	draw_text(5, 5, "Screen Center: (" + string(x) + ", " + string(y) + ")\n" +
					"Screen Bounds: (" + string(x - (global.cameraSize[X] / 2)) + ", " + string(y - (global.cameraSize[Y] / 2)) + ", " + string(x + (global.cameraSize[X] / 2)) + ", " + string(y + (global.cameraSize[Y] / 2)) + ")");
}

draw_text(5, 25, "Objects Drawn");
draw_text(80, 25, "--");

with(global.playerID){
	draw_text(5, 35, "HP: " + string(hitpoints) + "/" + string(maxHitpoints) +
				   "\nInternal Temp: " + string(internalTemperature) + 
				   "\nExternal Temp: " + string(externalTemperature));
}

draw_set_color(c_red);
shader_set_uniform_f_array(sOutlineColor, [0.5, 0.0, 0.0]);
draw_text(100, 25, string(totalObjectsDrawn));

shader_reset();*/