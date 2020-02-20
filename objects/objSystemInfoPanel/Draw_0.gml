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

// MAIN RECTANGLE
draw_set_color(_bgcol);
draw_rectangle(_dxx,_dyy,_dxx+panel_size,_dyy+panel_size,false);

// HEADING RECTANGLE
draw_set_color(make_color_rgb(64,64,64));
draw_rectangle(_dxx+1,_dyy+1,_dxx+panel_size-2,get_fonth(),false);

// OUTLINE
draw_rectangle_color(_dxx,_dyy,_dxx+panel_size,_dyy+panel_size,_c1,_c2,_c3,_c4,true);

//shader_set(smooth_font);
draw_set_font(smFont1);
draw_set_color(c_white);
cdrawstrs(2,2,"[SYSTEMS]", 
					 "   Weapons: N/A",
					 "    Mining: N/A",
					 "     Comms: N/A",
					 "Targetting: N/A");
//shader_reset();
draw_set_color(_olcol);
draw_set_alpha(_olal);
matrix_set(matrix_world,mid);