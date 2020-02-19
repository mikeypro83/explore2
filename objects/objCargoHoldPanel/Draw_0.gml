/// @description Insert description here
// You can write your code in this editor

m1 = matrix_build(self.x+camera_get_view_x(view_camera[0]), self.y+camera_get_view_y(view_camera[0]), 0, 0, 0, 0, 1, 1, 1);
mid = matrix_build_identity();
matrix_set(matrix_world,m1);

// Default visual property values
_dxx = 1;
_dyy = 1;
_dsize = panel_size;
_hdsize = _dsize / 2;
_hdsize = _dsize / 2;
_dcol = image_blend;
_dal = image_alpha;

_olcol = draw_get_color();
_olal = draw_get_alpha();

_bgcol = make_color_rgb(32,32,32);
_c1 = make_color_rgb(64,64,64);
_c2 = make_color_rgb(128,128,128);
_c3 = make_color_rgb(96,96,96);
_c4 = make_color_rgb(64,64,128);

draw_set_color(_bgcol);

draw_rectangle(_dxx,_dyy,_dxx+panel_size,_dyy+panel_size,false);

draw_rectangle_color(_dxx,_dyy,_dxx+panel_size,_dyy+panel_size,_c1,_c2,_c3,_c4,true);

// HEADING RECTANGLE
draw_set_color(make_color_rgb(64,64,64));
draw_rectangle(2,2,1+panel_size-2,1+get_font_h(),false);

draw_set_font(smFont1);
draw_set_color(c_white);



if(CargoHold!=noone && instance_exists(CargoHold))
{
	cdrawstr(2,2,"`[`6[ `FC`7ARGO `FH`7OLD `6]`]          (`7"+ string(CargoHold.CargoUsed) + "`8/`F"+ string(CargoHold.MaxCargo)+"`6)");
	draw_texts_array(8,get_font_h()+2,
		cargo_type.CargoCount-1, global.cargo_type_str);
	
	for(i = 0; i < cargo_type.CargoCount-1; ++i)
	{	
		draw_text(128,get_font_h()+2 + i*(get_font_h()), 
			string(CargoHold.CargoHold[i]));
	}
}
else
{
	draw_text(2,2,"[ CARGO HOLD N/A ]");
	draw_text(64,64,"( NO CARGO HOLD )");
}
					
draw_set_color(_olcol);
draw_set_alpha(_olal);
matrix_set(matrix_world,mid);