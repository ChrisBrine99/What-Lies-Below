/// @description Sets the font currently being used for drawing text on the GUI surface. Also, sets the texel size
/// based on that font's texture page size for accurate drawing.
/// @param font
/// @param [r/g/b]
/// @param textureID
/// @param sOutlineColor
/// @param sPixelWidth
/// @param sPixelHeight

var _font, _color, _textureID, _sOutlineColor, _sPixelWidth, _sPixelHeight;
_font = argument0;
_color = argument1;
_textureID = argument2;
_sOutlineColor = argument3;
_sPixelWidth = argument4;
_sPixelHeight = argument5;

draw_set_font(_font);
shader_set_uniform_f_array(_sOutlineColor, _color);
shader_set_uniform_f(_sPixelWidth, texture_get_texel_width(_textureID));
shader_set_uniform_f(_sPixelHeight, texture_get_texel_height(_textureID));