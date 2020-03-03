/// @description Insert description here
// You can write your code in this editor
event_inherited();

m1 = matrix_build(self.x+camera_get_view_x(view_camera[0]), self.y+camera_get_view_y(view_camera[0]), 0, 0, 0, 0, 1, 1, 1);
mid = matrix_build_identity();
matrix_set(matrix_world,m1);

draw_save_state();

draw_set_font(smFont1);
draw_set_color(c_white);
cdrawstrs(2,2,"[SYSTEMS]", 
					 "   Weapons: N/A",
					 "    Mining: N/A",
					 "     Comms: N/A",
					 "Targetting: N/A");

draw_restore_state();

matrix_set(matrix_world,mid);