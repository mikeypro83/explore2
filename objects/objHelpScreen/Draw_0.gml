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
draw_set_font(smFont1);

draw_set_color(c_white);

//shader_set(smooth_font);

cdrawstrs(8,8,"`[`E------------------------------------------------------`]",
						"`[`FEXPLORE2`] `7-- `FA 2D space shooter/mining game",
						"`7programming, design, everything: `bmichael scott stuart",
						"`E------------------------------------------------------",
						"`F F1 `6-- this help screen",
						"`FF11 `6-- fullscreen toggle",
						"`FF10 `6-- debug info toggle",
						"`FTAB `6-- selected next asteroid",
						"`FA,D `6-- turn left/right",
						"`FW,S `6-- accelerate/deccelerate",
						"`Fspacebar `6-- shoot laser",
						"`FC   `6-- toggle cargo panel",
						"`Falt-f4 `6or `fwindow close button`6 to quit");
					
//shader_reset();
					
draw_set_color(_olcol);
draw_set_alpha(_olal);
matrix_set(matrix_world,mid);