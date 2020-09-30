/// @description Draws the options for the current menu using the outline shader that should be set BEFORE
/// this function is called. It also handles the drawing of the menu's cursor, and the menu's scrollbar since
/// both of those entities piggyback off of the options themselves in order to function properly.
/// @param sOutlineColor

var _sOutlineColor, _sDrawOutline;
_sOutlineColor = argument0;
_sDrawOutline = argument1;

// Set the currently used alignment and font
draw_set_halign(optionAlign[X]);
draw_set_valign(optionAlign[Y]);
draw_set_font(optionFont);

var _index, _optionPosOffset;
_index = 0;
for (var i = firstToDraw; i < firstToDraw + numToDraw; i++){
	if (i == selOption){ // The option is using the default selection colors
		draw_set_color(optionSelectCol);
		shader_set_uniform_f_array(_sOutlineColor, optionSelectOutlineCol);
	} else if (i == auxSelOption){ // The option is using the auxillary selection colors
		draw_set_color(optionAuxSelectCol);
		shader_set_uniform_f_array(_sOutlineColor, optionAuxSelectOutlineCol);
	} else if (i == curOption){ // The option is using the highlighted colors
		draw_set_color(optionHighlightCol);
		shader_set_uniform_f_array(_sOutlineColor, optionHighlightOutlineCol);
		// Display an optional cursor if the flag is set to display it
		if (displayCursor){
			shader_set_uniform_i(_sDrawOutline, 0); // Disable drawing the outline for the menu's cursor sprite
			draw_sprite(cursorSprite, 0, cursorPos[X] + (optionSpacing[X] * _index), cursorPos[Y] + (optionSpacing[Y] * _index));
			shader_set_uniform_i(_sDrawOutline, 1); // Re-enabling the outline
		}
	} else{ // The option is using the standard colors
		draw_set_color(optionCol);
		shader_set_uniform_f_array(_sOutlineColor, optionOutlineCol);
	}
	// Draw the text using its relative position variables
	_optionPosOffset = optionPosOffset[| i];
	draw_text(optionPos[X] + _optionPosOffset[X] + (optionSpacing[X] * _index), optionPos[Y] + _optionPosOffset[Y] + (optionSpacing[Y] * _index), option[| i]);
	// Finally, increment the index variable
	_index++;
}

// Optionally, draw the scrollbar at the position set for if it is enabled.
if (displayScrollbar){
	// Set the color for the scrollbar's outline
	shader_set_uniform_f_array(_sOutlineColor, scrollbarInnerCol);
	// Calculate the size of the scrollbar relative to its full height
	var _scrollbarSize, _scrollbarOffset;
	_scrollbarSize = round(scrollbar[W] * (numToDraw / menuSize));
	if (array_equals(scrollbarDirection, [1, 0])){ // A horizontal scrollbar (W and Z values flipped)
		_scrollbarOffset = scrollbar[X] + lerp(scrollbar[X], scrollbar[X] + scrollbar[W] - _scrollbarSize, firstToDraw / max(1, menuSize - numToDraw));

		shader_set_uniform_i(_sDrawOutline, 0); // Disable drawing the outline for the background of the scrollbar
		draw_sprite_ext(spr_rectangle, 0, scrollbar[X], scrollbar[Y], scrollbar[W], scrollbar[Z], 0, c_black, image_alpha);
		shader_set_uniform_i(_sDrawOutline, 1); // Re-enabling the outline for the actual scrollbar
		
		draw_sprite_ext(spr_rectangle, 0, _scrollbarOffset, scrollbar[Y], _scrollbarSize, scrollbar[Z], 0, scrollbarInnerCol, image_alpha);
	} else if (array_equals(scrollbarDirection, [0, 1])){ // A vertical scrollbar
		_scrollbarOffset = scrollbar[Y] + lerp(scrollbar[Y], scrollbar[Y] + scrollbar[W] - _scrollbarSize, firstToDraw / max(1, menuSize - numToDraw));
		
		shader_set_uniform_i(_sDrawOutline, 0); // Disable drawing the outline for the background of the scrollbar
		draw_sprite_ext(spr_rectangle, 0, scrollbar[X], scrollbar[Y], scrollbar[Z], scrollbar[W], 0, c_black, image_alpha);
		shader_set_uniform_i(_sDrawOutline, 1); // Re-enabling the outline for the actual scrollbar
		
		draw_sprite_ext(spr_rectangle, 0, scrollbar[X], _scrollbarOffset, scrollbar[Z], _scrollbarSize, 0, scrollbarInnerCol, image_alpha);
	}
}