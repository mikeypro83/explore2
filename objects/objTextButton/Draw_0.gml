/// @description Draw Button
// You can write your code in this editor
{
	// Override normal panel drawing
	//event_inherited();
	m1 = matrix_build(self.x+get_activecam_viewx(), self.y+get_activecam_viewy(), 0, 0, 0, 0, 1, 1, 1);
	mid = matrix_build_identity();
	matrix_set(matrix_world,m1);
	_olcol = draw_get_color();	
	_x=0;
	_y=0;
	_tx=0;
	_ty=0;
	str_plen = string_width(strip_string(self.Text));
	Size = Size < 1 ? Padd + str_plen + Padd : Size;
	YSize = _y+get_fonth(Font);

	// OUTLINE RECTANGLE
	if(MouseOver==false) draw_set_color(BGColor) else draw_set_color(BGHiColor);
	if(MouseOver && global.LMBIsDown) 
	{
		draw_set_color(BGDownColor);
		_tx++;_ty++;
		draw_rectangle_color(_x,_y,_x+Size,_y+YSize,Color1,Color2,Color3,Color4,false);
		draw_rectangle_color(_x,_y,_x+Size,_y+YSize,Color2,Color1,Color4,Color3,true);	
	}
	else 
	{		
		draw_rectangle_color(_x,_y,_x+Size,_y+YSize,Color2,Color1,Color4,Color3,false);
		draw_rectangle_color(_x,_y,_x+Size,_y+YSize,Color1,Color2,Color3,Color4,true);
	}
		
	
	_f = draw_get_font();
	draw_set_font(Font);
	draw_set_color(c_white);	// default font color as backup
	if(MouseOver)
	{
		cdrawstrs(_x+(Size/2)-(str_plen/2),_y+1, "`0"+strip_string(HiText));
		cdrawstrs(_ty+_x+(Size/2)-(str_plen/2),_ty+_y+1, HiText);
	}
	else if(global.LMBIsDown)
	{
		cdrawstrs(_x+(Size/2)-(str_plen/2),_y+1, "`0"+strip_string(Text));
		cdrawstrs(_ty+_x+(Size/2)-(str_plen/2),_ty+_y+1, Text);
	}
	else
		cdrawstrs(_ty+_x+(Size/2)-(str_plen/2),_ty+_y+1, Text);
	
	
	draw_set_font(_f);
	draw_set_color(_olcol);
	matrix_set(matrix_world,mid);
}