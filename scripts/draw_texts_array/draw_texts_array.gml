/////////////////////////////////////////////////////////////////////////////////////////////////
/// @description draw_texts_array( X,Y, [String Array])
/// @param {real} X X-position to start drawing text
/// @param {real} Y Y-position to start drawing text
/// @param {array} String[] Array of strings to draw
/////////////////////////////////////////////////////////////////////////////////////////////////
// ADDITIONAL INFO FOR USE:
// Set global.draw_texts_auto_height variable to < 1 for auto row height calculations, anything
// else manually spaces rows by that amount of pixels. Ie. 12 would space each row by 12 pixels.
/////////////////////////////////////////////////////////////////////////////////////////////////
// author: michael scott stuart (mikeypro83)
// email: michaelscottstuart@yahoo.com
// license: modified freeware, open-source: Original attribution of work required for all
//			distributions of derived and original versions of this work.
/////////////////////////////////////////////////////////////////////////////////////////////////
{
	if ( argument_count < 3 )
		show_error("draw_texts: not enough arguments", true);
	_h = 0; // Pixels height of each row
	global.draw_texts_auto_height = 
		(variable_global_exists("draw_texts_auto_height")) ? global.draw_texts_auto_height : 0;	
	_h = (global.draw_texts_auto_height < 1) ? string_height("0QDJT") : global.draw_texts_auto_height;
	// Start looping through arguments after the x,y parameters (0 and 1)
	if(argument_count==4)
	{
		_len = argument[2];
		_arr = argument[3];
	}
	else
	{
		_arr = argument[2];
		_len = array_length_1d(_arr);
	}
	for(iaaaa = 0; iaaaa < _len; ++iaaaa)
	{	
		_str = _arr[iaaaa];
		draw_text_c(argument[0],argument[1],_str);
		argument[1] += _h;
	}
	return;
}