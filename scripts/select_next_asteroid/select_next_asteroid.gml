/////////////////////////////////////////////////////////////////////////////////////////////////
/// @description select_next_asteroid()
/// @param 
/////////////////////////////////////////////////////////////////////////////////////////////////
// ADDITIONAL INFO FOR USE:
// 
/////////////////////////////////////////////////////////////////////////////////////////////////
// author: michael scott stuart (mikeypro83)
// email: michaelscottstuart@yahoo.com
/////////////////////////////////////////////////////////////////////////////////////////////////
{
	global.iTabSelectedAsteroid++;
	if(global.iTabSelectedAsteroid>global.asteroid_count-1)
		global.iTabSelectedAsteroid=0;
	return;
}