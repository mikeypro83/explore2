/////////////////////////////////////////////////////////////////////////////////////////////////
/// @function get_fonth([Font, optional])
/// @description Returns the Font's pixel height, will use draw_get_font() if no parameter.
/// @param {font} Font [optional]
/////////////////////////////////////////////////////////////////////////////////////////////////
// ADDITIONAL INFO FOR USE:
/////////////////////////////////////////////////////////////////////////////////////////////////
// author: michael scott stuart (mikeypro83)
// email: michaelscottstuart@yahoo.com
// license: modified freeware, open-source: Original attribution of work is required for all
//			distributions of derived and original versions of this work. Failure to provide a
//			visible and apparent notice of original attribution defaults any derived work to a 
//			commercial license and therefore applicable fees will apply for licensing said work. 
//			(see commercial.txt)
/////////////////////////////////////////////////////////////////////////////////////////////////
{
	_of = draw_get_font();
	_f = _of;
	if(argument_count==1)
	{
		if (font_exists(argument[0]==false)) show_error("get_fonth: argument[0] is not a font.",true);	
		_f = argument[0];
	}
	if(_f!=_of) draw_set_font(_f);
	_h = string_height("0QDT#!");
	if(_f!=_of) draw_set_font(_of);
	return _h;
}