/////////////////////////////////////////////////////////////////////////////////////////////////
/// @function sizeof_vector
/// @description returns the size of a vector
/// @param {vector} Vector 
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
	if(argument_count!=1) show_error("get_vector_size: argument count must be 1",true);
	if(!is_array(argument[0])) show_error("get_vector_size: vectors are 1d-arrays, argument[0] is not a 1d-array.",true);
	return (array_length_1d(argument[0]));
}