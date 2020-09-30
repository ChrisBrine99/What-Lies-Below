/// @description Drawing HUD and Menu Elements

#region SETTING ALPHA LEVEL

if (image_alpha <= 0){
	return; // Don't draw the HUD if the image is transparent
}
draw_set_alpha(image_alpha);

#endregion

#region DRAWING TEXT WITH OUTLINE SHADER

shader_set(outlineShader);
shader_set_uniform_i(sDrawOutline, 1); // Make sure outline is enabled for text

draw_set_color(c_white);
outline_set_font(font_gui_xSmall, [0.5, 0.5, 0.5], global.texFontXSmall, sOutlineColor, sPixelWidth, sPixelHeight);

draw_text(5, 5, "Delta Time: " + string(global.deltaTime));

var _sOutlineColor = sOutlineColor;
with(global.playerID){
	draw_text(5, 20, "Hitpoints\nRegen Speed\n\nInternal Temp\nRoom Temp");
	draw_text(75, 20, "=\n=\n\n=\n=");
	
	draw_set_color(c_red);
	shader_set_uniform_f_array(_sOutlineColor, [0.5, 0, 0]);
	
	draw_text(85, 20, string(hitpoints) + "/" + string(maxHitpoints) + "\n" +
					  string(hpRegenAmount / max(1, regenSpeed)) + " hp/sec\n\n" +
					  string(internalTemperature) + " C\n" +
					  string(externalTemperature) + " C");
}

// FOR TESTING
with(par_menu){
	draw_menu_controls(_sOutlineColor);
	
	draw_set_halign(fa_left);
}

shader_reset();

#endregion