/// @description Insert description here
// You can write your code in this editor

m1 = matrix_build(self.x,self.y,0,0,0,image_angle,image_xscale,image_yscale,1);
mid = matrix_build_identity();
matrix_set(matrix_world,m1);
_olcol = draw_get_color();
_olal = draw_get_alpha();

draw_set_alpha(image_alpha);
draw_line_color(-0.5,-primitive_size,0.5, primitive_size, image_blend,image_blend );

draw_set_color(_olcol);
draw_set_alpha(_olal);
matrix_set(matrix_world,mid);