/////////////////////////////////////////////////////////////////////////////////////////////////
/// @function strip_string(color-coded-string)
/// @description Strips all color-codes from a string and returns it as a new string
/////////////////////////////////////////////////////////////////////////////////////////////////
// ADDITIONAL INFO FOR USE: Does not modify the original string
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
	if(argument_count!=1) show_error("stripped_string_length(): takes exactly 1 argument", true);
	if(!is_string(argument[0])) show_error("stripped_string_length(): argument[0] must be a string", true);
	_code=false;
	_str=argument[0];
	_ret="";
	for(i=0;i<string_length(_str);++i)
	{
		_ch = string_char_at(_str,i+1);
		switch(_ch)
		{
			case "`": _code = true; continue; break;
			case "[": // \/\/\/\/\/
			case "]": continue; break;
		}
	
		if(_code)
		{
			_code=false;
			switch(_ch)
			{
				case "`": _ret += "`"; continue; break; // this is a special case, the user wants a ` drawn
			}
			continue;	// otherwise skip this character altogether because it is code (even if an undefined one)
		}	
		_ret += _ch;
	}
	return _ret;
}