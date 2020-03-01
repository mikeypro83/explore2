/// @description Insert description here
// You can write your code in this editor
event_inherited();

m1 = matrix_build(self.x+camera_get_view_x(view_camera[0]), self.y+camera_get_view_y(view_camera[0]), 0, 0, 0, 0, 1, 1, 1);
mid = matrix_build_identity();
matrix_set(matrix_world,m1);

// Default visual property values
draw_save_state();

draw_set_color(c_white);

nstr = global.oPlayer.oTarget != noone ? string(global.oPlayer.oTarget.Name) : "N/A";
dstr = global.oPlayer.oTarget != noone ? string(global.oPlayer.oTarget.Damage) : "N/A";

cdrawstrs(2,2,"`6[`FTARGET`6]",
					 "`f  Type`6: `e" + nstr,
					 "`fDamage`6: `e"  +dstr,
					 "`f  tgt#`6: `e" + string(global.iTabSelectedAsteroid));

draw_restore_state();
matrix_set(matrix_world,mid);