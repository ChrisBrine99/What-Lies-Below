/// @description Draw the Menu and Whatever Current Section Is Active

// Drawing menu backgrounds, images using draw_sprite_ext, etc. ////////////////////

// Drawing the background for each of the available item slots
var _curOption = 0;
for (var yy = 0; yy < menuDimensions[Y]; yy++){
	for (var xx = 0; xx < menuDimensions[X]; xx++){
		_curOption = (menuDimensions[X] * yy) + xx; // Gets the option's true index within the menu based on its width
		
		// Early exit if the _curOption variable is greater than the menu's size
		if (_curOption >= numOptions){
			break;
		}
		
		if (_curOption == curOption){ // The item has been highlighted by the user
			draw_rect_outline(optionPos[X] + (xx * optionSpacing[X]), optionPos[Y] + (yy * optionSpacing[Y]), 18, 18, colorItemHighlightBack, c_white, 0.5, 1); 	
		} else{ // The option isn't highlighted or selected, but it's visible
			draw_rect_outline(optionPos[X] + (xx * optionSpacing[X]), optionPos[Y] + (yy * optionSpacing[Y]), 18, 18, colorItemBack, c_black, 0.5, 1); 
		}
	}
	// Early exit if the _curOption variable is greater than the menu's size
	if (_curOption >= numOptions){
		break;
	}
}


////////////////////////////////////////////////////////////////////////////////////

// Drawing the menu's text-based elements //////////////////////////////////////////

// Enable the outline for any text on the menu
shader_set(outlineShader);
shader_set_uniform_i(sDrawOutline, 1); // Make sure outline is always enabled

// Drawing the current highlighted item's name
draw_set_color(optionCol);
shader_set_uniform_f_array(sOutlineColor, optionOutlineCol);
outline_set_font(optionFont, global.fontTextures[? optionFont], sPixelWidth, sPixelHeight);

draw_text(100, 120, "OPTION NAME" + string(curOption));

// Drawing the highlighted item's description
draw_menu_options_info(sOutlineColor);

// Make sure to reset the horizontal alignment and the current shader at the end of drawing text
draw_set_halign(fa_left);
shader_reset();

////////////////////////////////////////////////////////////////////////////////////