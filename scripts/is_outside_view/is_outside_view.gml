/////////////////////////////////////////////////////////////////////////////////////////////////
/// @function is_outside_view() [ returns bool ]
/// @description Checks to see if the object is inside the view of the camera number supplied.
/// @param {real} ObjectID Object to check 
/// @param {real} Camera Number (usually 0)
/////////////////////////////////////////////////////////////////////////////////////////////////
// ADDITIONAL INFO FOR USE:
// 
/////////////////////////////////////////////////////////////////////////////////////////////////
// author: michael scott stuart (mikeypro83)
// email: michaelscottstuart@yahoo.com
/////////////////////////////////////////////////////////////////////////////////////////////////
{
	if(argument_count<2) show_error("is_outside_view: argument_count < 2",true);
	xp = camera_get_view_x(view_camera[argument[1]]);
	yp = camera_get_view_y(view_camera[argument[1]]);
	xxp = xp+camera_get_view_width(view_camera[argument[1]]);
	yyp = yp+camera_get_view_height(view_camera[argument[1]]);
	return (  (argument[0].x < xp || argument[0].x > xxp) || (argument[0].y < yp || argument[0].y > yyp) );	
}