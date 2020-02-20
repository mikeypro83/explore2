/////////////////////////////////////////////////////////////////////////////////////////////////
/// @function draw_save_alpha()
/// @description Saves the alpha value used for drawing into the global variable _saved_alpha
/////////////////////////////////////////////////////////////////////////////////////////////////
// ADDITIONAL INFO FOR USE:
/////////////////////////////////////////////////////////////////////////////////////////////////
// author: michael scott stuart (mikeypro83)
// email: michaelscottstuart@yahoo.com
/////////////////////////////////////////////////////////////////////////////////////////////////
{
	global._saved_alpha = draw_get_alpha();
	return 0;
}
