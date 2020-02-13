/// @description Insert description here
// You can write your code in this editor

_olcol = draw_get_color();
_olal = draw_get_alpha();

_x = self.x - camera_get_view_x(view_camera[0]);
_y = self.y - camera_get_view_y(view_camera[0]);

m1 = matrix_build(_x,_y,0.0,0.0,0.0,image_angle,image_xscale,image_yscale,1.0);
m2 = matrix_multiply(m1,matrix_get(matrix_world));
mid = matrix_build_identity();
matrix_set(matrix_world,m1);

//draw_text_c(0,0,"`fX");

draw_set_color(c_red);
//draw_circle(0,0,planet_size,true);

matrix_set(matrix_world,mid);
draw_set_color(_olcol);
draw_set_alpha(_olal);