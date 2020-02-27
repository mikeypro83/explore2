/////////////////////////////////////////////////////////////////////////////////////////////////
/// @function draw_save_state(savecolor, savealpha)
/// @description Saves the alpha and color values for drawing based on the parameters
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
	if(argument_count==0)
	{
		global._saved_alpha = draw_get_alpha();
		global._saved_color = draw_get_color();
	}
	if(argument_count>0)
		if(argument[0])
			global._saved_alpha = draw_get_alpha();
	if(argument_count>1)
		if(argument[1])
			global._saved_color = draw_get_color();
	return 0;
}
