/////////////////////////////////////////////////////////////////////////////////////////////////
/// @description cdrawstrs( X,Y, ( [String-Array] | StringX, ..., StringN )
/// @param {real} X X-position to start drawing text
/// @param {real} Y Y-position to start drawing text
/// @param {string} [String-Array-OR-String]
/// @param {string} [...]
/////////////////////////////////////////////////////////////////////////////////////////////////
// ADDITIONAL INFO FOR USE:
// Set global.draw_texts_auto_height variable to < 1 for auto row height calculations, anything
// else manually spaces rows by that amount of pixels. Ie. 12 would space each row by 12 pixels.
/////////////////////////////////////////////////////////////////////////////////////////////////
// author: michael scott stuart (mikeypro83)
// email: michaelscottstuart@yahoo.com
/////////////////////////////////////////////////////////////////////////////////////////////////
{
	if(variable_global_exists("cdrawstrs_height")==false)
		global.cdrawstrs_height=0;
	_h = global.cdrawstrs_height;
	
	if( argument_count < 3 ) show_error("cdrawstrs: not enough arguments", true);
	
	_usearray = is_array(argument[2]);
	_arrsize = _usearray ? array_length_1d(argument[2]) : 0;
	
	if(_usearray)
	{
		for(i=0;i<_arrsize;++i)
		{
			cdrawstr(argument[0],argument[1],argument[2][i]);
			argument[1] += _h;
		}
	}
	else // _usearray = false
	{
		for(i=0;i<argument_count-2;++i)
		{
			cdrawstr(argument[0],argument[1],argument[i]);
			argument[1] += _h;
		}		
	}
	
	return 0;
}