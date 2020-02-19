/////////////////////////////////////////////////////////////////////////////////////////////////
/// @function get_vector(Vector, Index)
/// @description returns the value at vector position Index 
/// @param {vector} The Vector
/// @param {real} Index
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
	if(argument_count!=2) show_error("get_vector: requires exactly 2 arguments. Vector, Index",true);
	if(!is_array(argument[0])) show_error("get_vector: argument[0] must be a 1d-array based vector.",true);
	if(!is_real(argument[1])) show_error("get_vector: argument[1] must be a real or int value.",true);
	if(argument[1] > (array_length_1d(argument[0])-1)) show_error("get_vector: argument[1] > size of vector argument[0].",true);
	if(argument[1] < 0) show_error("get_vector: argument[1] < 0. Must be a range from 0 to size of vector argument[0].",true);	
	return argument[0][argument[1]];
}