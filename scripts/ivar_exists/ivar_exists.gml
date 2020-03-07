/////////////////////////////////////////////////////////////////////////////////////////////////
/// @function ivar_exists
/// @description checks to see if an instance variable exists or not returns true if it does
/// @param {instance-id} Instance
/// @param {string} string version of the variable name, ie.: "isAwake"
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
	func_name = "ivar_exists";
	if(argument_count<2) show_error(func_name+"(instance, string) requires two arguments.",true);
	if(instance_exists(argument[0]==false)) show_error(func_name+": instance argument[0] does not exist.",true);
	if(is_string(argument[1]==false)) show_error(func_name+": argument[1] must be a string.",true);
	return (variable_instance_exists(argument[0],argument[1]));
}