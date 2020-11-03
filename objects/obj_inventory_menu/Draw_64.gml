/// @description Draw the Menu and Whatever Current Section Is Active

// Drawing menu backgrounds, images using draw_sprite_ext, etc. ////////////////////

draw_menu_scrollbars();

////////////////////////////////////////////////////////////////////////////////////

// Drawing the menu's text-based elements //////////////////////////////////////////

// Enable the outline for any text on the menu
shader_set(outlineShader);
shader_set_uniform_i(sDrawOutline, 1); // Make sure outline is always enabled

draw_menu_options(sOutlineColor);
draw_menu_controls(sOutlineColor);

// Make sure to reset the horizontal alignment at the end of drawing text
draw_set_halign(fa_left);

////////////////////////////////////////////////////////////////////////////////////