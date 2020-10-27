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
shader_set_uniform_f_array(sOutlineColor, [0.5, 0.5, 0.5]);
outline_set_font(font_gui_xSmall, global.texFontXSmall, sPixelWidth, sPixelHeight);

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
if (global.gameState == GameState.InMenu){
	var _sDrawOutline = sDrawOutline;
	with(par_menu){
		// NOTE -- In any real menu's draw code, the shader has to be temporarily reset
		// in order to use draw_sprite_ext. For some reason, it doesn't work whenever the
		// outline shader isn't currently active.
		draw_menu_options(_sOutlineColor, _sDrawOutline);
		draw_menu_controls(_sOutlineColor);
		draw_set_halign(fa_left);
	}	
}

/// TODO -- Eventually this draw code should be written in such a way that allows any object/menu to be
/// pointed to its draw function instead of everything being coded here.

shader_reset();


/*var _a, _b;
_a = 0;
_b = 0;
repeat(7){
	repeat(4){
		draw_sprite_ext(spr_rectangle, 0, 120 + (_b * 19), 20 + (_a * 19), 18, 18, 0, c_black, 1);
		draw_sprite_ext(spr_rectangle, 0, 121 + (_b * 19), 21 + (_a * 19), 16, 16, 0, c_white, 1);
		_b++;
	}
	_b = 0;
	_a++;
}*/

#endregion