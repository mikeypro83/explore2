/////////////////////////////////////////////////////////////////////////////////////////////////
/// @description cdrawstrs( X,Y, ( [String-Array] | StringX, ..., StringN )
/// @param {real} X X-position to start drawing text
/// @param {real} Y Y-position to start drawing text
/// @param {string} [String-Array-OR-String]
/// @param {string} [...]
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
	if(variable_global_exists("cdrawstrs_height")==false)
		global.cdrawstrs_height=0;
	_h = global.cdrawstrs_height <= 0.0 ? get_fonth() : _h;	
	
	if( argument_count < 3 ) show_error("cdrawstrs: not enough arguments", true);
		
	_usearray = is_array(argument[2]);
	_arrsize = _usearray ? array_length_1d(argument[2]) : 0;
	
	if(_usearray)
	{
		for(i=0;i<_arrsize;++i)
		{
			_t = argument[2];
			cdrawstr(argument[0],argument[1],_t[i]);
			if(global.cdrawstr_incd_y) 
			{
				global.cdrawstr_incd_y=false;
				argument[1] += _h*2;
			}
			else
				argument[1] += _h;
		}
	}
	else // _usearray = false
	{
		for(i=2;i<argument_count;++i)
		{
			cdrawstr(argument[0],argument[1],argument[i]);			
			if(global.cdrawstr_incd_y) 
			{
				global.cdrawstr_incd_y=false;
				argument[1] += _h*2;				
			}
			else
				argument[1] += _h;			
		}		
	}
	
	return 0;
}