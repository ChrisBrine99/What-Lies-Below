/// @description Draws the options for the current menu using the outline shader that should be set BEFORE
/// this function is called.
/// @param sOutlineColor

var _sOutlineColor = argument0;

// Set the currently used alignment and font
draw_set_halign(optionAlign[X]);
draw_set_valign(optionAlign[Y]);
outline_set_font(optionFont, global.fontTextures[? optionFont], sPixelWidth, sPixelHeight);

var _index, _curOption, _index2D;
_index = 0;
for (var yy = firstRowToDraw; yy < firstRowToDraw + numRowsToDraw; yy++){
	// Go through every element on that row and draw it
	for (var xx = 0; xx < menuWidth; xx++){
		_curOption = (menuWidth * yy) + xx; // Gets the option's true index within the menu based on its width
		_index2D = _curOption * 2;
		
		// Early exit if the _curOption variable is greater than the menu's size
		if (_curOption >= menuSize){
			break;
		}
		
		// If the menu option is inactive; just display it with the inactive text color
		if (!optionActive[| _curOption]){
			draw_set_color(optionInactiveCol);
			shader_set_uniform_f_array(_sOutlineColor, optionInactiveOutlineCol);
			draw_text(optionPos[X] + optionPosOffset[| _index2D] + (optionSpacing[X] * xx), optionPos[Y] + optionPosOffset[| _index2D + 1] + (optionSpacing[Y] * _index), option[| _curOption]);
			continue;
		}

		if (_curOption == selOption){ // The option is using the default selection colors
			draw_set_color(optionSelectCol);
			shader_set_uniform_f_array(_sOutlineColor, optionSelectOutlineCol);
		} else if (_curOption == auxSelOption){ // The option is using the auxillary selection colors
			draw_set_color(optionAuxSelectCol);
			shader_set_uniform_f_array(_sOutlineColor, optionAuxSelectOutlineCol);
		} else if (_curOption == curOption){ // The option is using the highlighted colors
			draw_set_color(optionHighlightCol);
			shader_set_uniform_f_array(_sOutlineColor, optionHighlightOutlineCol);
		} else{ // The option is using the standard colors
			draw_set_color(optionCol);
			shader_set_uniform_f_array(_sOutlineColor, optionOutlineCol);
		}
		// Draw the text using its relative position variables
		draw_text(optionPos[X] + optionPosOffset[| _index2D] + (optionSpacing[X] * xx), optionPos[Y] + optionPosOffset[| _index2D + 1] + (optionSpacing[Y] * _index), option[| _curOption]);
	}
	// Early exit if the _curOption variable is greater than the menu's size
	if (_curOption >= menuSize){
		break;
	}
	// Finally, increment the index variable
	_index++;
}