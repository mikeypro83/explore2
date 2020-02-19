/////////////////////////////////////////////////////////////////////////////////////////////////
/// @function set_vector
/// @description sets a vector's values
/// @param {vector} The vector to set
/// @param {X} ValueX...
/// @param {X} ValueN...
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
	if(argument_count!=1) show_error("set_vector: argument_count must be 1.", true);
	if(!is_array(argument[0])) show_error("set_vector: vectors are 1d-arrays, argument[0] is not a 1d-array.",true);
	_vect = argument[0];
	_size = array_length_1d(_vect);		
	if(_size!=argument_count) show_error("set_vector: number of argument values is not equal to size of vector.",true);
	for(i=0;i<_size;++i)
		_vect[i] = argument[i];
	return _vect;
}