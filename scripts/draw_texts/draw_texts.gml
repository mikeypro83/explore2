/////////////////////////////////////////////////////////////////////////////////////////////////
/// @description draw_texts( X,Y, TEXT ROW(1), ..., TEXT ROW(N) )
/// @param {real} X X-position to start drawing text
/// @param {real} Y Y-position to start drawing text
/// @param {string} Row(1) First Text Row
/// @param {string} ... Subsequent Text Rows
/// @param {string} Row(N) Last Text Row
/////////////////////////////////////////////////////////////////////////////////////////////////
// ADDITIONAL INFO FOR USE:
// Set global.draw_texts_auto_height variable to < 1 for auto row height calculations, anything
// else manually spaces rows by that amount of pixels. Ie. 12 would space each row by 12 pixels.
/////////////////////////////////////////////////////////////////////////////////////////////////
// author: michael scott stuart (mikeypro83)
// email: michaelscottstuart@yahoo.com
/////////////////////////////////////////////////////////////////////////////////////////////////
{
	if ( argument_count < 3 )
		show_error("draw_texts: not enough arguments", true);
	_h = 0; // Pixels height of each row
	global.draw_texts_auto_height = 
		(variable_global_exists("draw_texts_auto_height")) ? global.draw_texts_auto_height : 0;	
	_h = (global.draw_texts_auto_height < 1) ? string_height("0QDJT") : global.draw_texts_auto_height;
	// Start looping through arguments after the x,y parameters (0 and 1)	
	for(_dtc = 2; _dtc < argument_count; ++_dtc)
	{		
		_str = argument[_dtc];		
		cdrawstr(argument[0],argument[1],_str);
		argument[1] += _h;
	}

	return;
}