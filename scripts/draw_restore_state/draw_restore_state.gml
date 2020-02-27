/////////////////////////////////////////////////////////////////////////////////////////////////
/// @function draw_restore_state(savecolor, savealpha)
/// @description Restores the saved alpha and/or color values for drawingf based on parameters.
/////////////////////////////////////////////////////////////////////////////////////////////////
// ADDITIONAL INFO FOR USE:
//	creates a global._saved_alpha variable is one does not already exist.
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
	
	if(variable_global_exists("_saved_alpha")==false) global._saved_alpha=1.0;
	if(variable_global_exists("_saved_color")==false) global._saved_color=c_white;
	if(argument_count==0)
	{		
		draw_set_alpha(global._saved_alpha); 	
		draw_set_color(global._saved_color);
	}	
	if(argument_count>0)
		if(argument[0])
			draw_set_alpha(global._saved_alpha);
	if(argument_count>1)
		if(argument[1])
			draw_set_color(global._saved_color);
	return 0;
}
