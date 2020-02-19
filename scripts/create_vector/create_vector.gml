/////////////////////////////////////////////////////////////////////////////////////////////////
/// @function create_vector
/// @description create a vector of any size and value
/// @param {X} X...
/// @param {X} N...
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
	if(argument_count<2) show_error("create_vector: a vector must have at least 2 values.",true);
	_vect = array_create(argument_count,0);
	for(i=0;i<argument_count;++i)
		_vect[i] = argument[i];
	return _vect;
}