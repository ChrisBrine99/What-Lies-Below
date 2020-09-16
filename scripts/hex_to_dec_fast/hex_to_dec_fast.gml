//var hex = string_upper(argument0);
var hex = argument0;
var res = 0;

for (var i=1; i<=string_length(hex); i++)
{
	var n = ord(string_char_at(hex, i));
	res = (res << 4) + (((n + 4) % 23 - 6) & 15);
}

return res;