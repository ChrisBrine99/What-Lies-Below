/// @description Sets the font currently being used for drawing text on the GUI surface. Also, sets the texel 
/// size based on that font's texture page size for accurate drawing.
/// @param font
/// @param textureID
/// @param sPixelWidth
/// @param sPixelHeight

var _font, _textureID, _sPixelWidth, _sPixelHeight;
_font = argument0;
_textureID = argument1;
_sPixelWidth = argument2;
_sPixelHeight = argument3;

draw_set_font(_font);
shader_set_uniform_f(_sPixelWidth, texture_get_texel_width(_textureID));
shader_set_uniform_f(_sPixelHeight, texture_get_texel_height(_textureID));