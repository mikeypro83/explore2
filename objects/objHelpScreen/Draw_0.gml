/// @description Insert description here
// You can write your code in this editor
event_inherited();
draw_self();

m1 = matrix_build(self.x+camera_get_view_x(view_camera[0]), self.y+camera_get_view_y(view_camera[0]), 0, 0, 0, 0, 1, 1, 1);
mid = matrix_build_identity();
matrix_set(matrix_world,m1);

draw_save_state();
draw_set_color(c_white);

cdrawstrs(8,8,"`[`E------------------------------------------------------`]`n"+	
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

draw_restore_state();
matrix_set(matrix_world,mid);