/// @description Drawing Debug Information

shader_set(outlineShader);
shader_set_uniform_i(sDrawOutline, 1); // Make sure outline is enabled for text

outline_set_font(font_gui_small, global.fontTextures[? font_gui_small], sPixelWidth, sPixelHeight);

draw_set_color(c_white);
shader_set_uniform_f_array(sOutlineColor, [0.5, 0.5, 0.5]);

draw_text(5, 5, "Delta Time\nTotal Playtime\n");

draw_set_color(c_red);
shader_set_uniform_f_array(sOutlineColor, [0.5, 0, 0]);

draw_text(80, 5, string(global.deltaTime) + "\n00:00:00");

shader_reset();