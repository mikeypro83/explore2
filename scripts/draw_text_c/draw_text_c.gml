///////////////////////////////////////////////////////////////////////////////////////////////////
/// @description draw_textc( X,Y, COLOR-CODED-TEXT-STRING )
/// @param {real} X X-position to start drawing text
/// @param {real} Y Y-position to start drawing text
/// @param {string} Text String
/////////////////////////////////////////////////////////////////////////////////////////////////
// ADDITIONAL INFO FOR USE:
// TODO: COLOR CODES
/////////////////////////////////////////////////////////////////////////////////////////////////
// author: michael scott stuart (mikeypro83)
// email: michaelscottstuart@yahoo.com
/////////////////////////////////////////////////////////////////////////////////////////////////
{
	
	_str = argument[2];
	if(!is_string(_str)) show_error("draw_text_c: argument[2] is not a string",true);
	_l = string_length(_str);											
	_dtci = 0;
	_xx = argument[0];
	_yy = argument[1];
	coding = false;
	black_outline = false;
	while(_dtci <= _l) 
	{
		_ch = string_char_at(_str,_dtci+1); // because string char at starts at index 1.		
		if(coding==false)
		{
			switch(_ch)
			{
				case "`":
					coding = true;
					_dtci++;
					continue;
					break;
			} // switch
		}
		else
		{
			switch(string_upper(_ch))
			{
				case "0": draw_set_color(c_black); break;
				case "1": draw_set_color(c_navy); break;
				case "2": draw_set_color(make_color_rgb(8,64,0)); break;
				case "3": draw_set_color(c_teal); break;
				case "4": draw_set_color(c_maroon); break;
				case "5": draw_set_color(c_purple);break;
				case "6": draw_set_color(c_gray); break;
				case "7": draw_set_color(c_ltgray); break;
				case "8": draw_set_color(c_dkgray); break;
				case "9": draw_set_color(c_blue); break;
				case "A": draw_set_color(c_lime); break;
				case "B": draw_set_color(c_aqua); break;
				case "C": draw_set_color(c_red); break;
				case "D": draw_set_color(c_fuchsia); break;
				case "E": draw_set_color(c_yellow); break;
				case "F": draw_set_color(c_white); break;
				case "[": black_outline = true; break;
				case "]": black_outline = false; break;
			}
			coding = false;
			_dtci++;
			continue;
		}
		
		
		if(coding==false) 
		{		
			if(black_outline) 
			{
				set_shader_blacken(font_get_texture(smFont1));
				draw_text(_xx,_yy, _ch);
				shader_reset();
			}
			draw_text(_xx,_yy, _ch);
			_xx += string_width(_ch);
		}		
		_dtci++;
	} // while
	
	return;
}