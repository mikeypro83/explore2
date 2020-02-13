/// @description Insert description here
// You can write your code in this editor

m1 = matrix_build(self.x,self.y,0, 0, 0, image_angle, image_xscale, image_yscale, 1);
mid = matrix_build_identity();
matrix_set(matrix_world,m1);
_olcol = draw_get_color();
_olal = draw_get_alpha();

draw_set_color(image_blend);
draw_set_alpha(image_alpha);

draw_line_width(0,laser_power,0,-laser_power,laser_power/2);

draw_set_color(_olcol);
draw_set_alpha(_olal);
matrix_set(matrix_world,mid);
