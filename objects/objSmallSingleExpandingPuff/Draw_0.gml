/// @description Insert description here
// You can write your code in this editor

// x,y,z,xrot,yrot,zroy,xscale,yscale,zscale
m1 = matrix_build(self.x, self.y, 0, 0, 0, image_angle, image_xscale, image_yscale, 1);
m2 = matrix_multiply(m1,matrix_get(matrix_world));
mid = matrix_build_identity();
matrix_set(matrix_world,m1);

_olcol = draw_get_color();
_olal = draw_get_alpha();

draw_set_color(image_blend);
draw_set_alpha(image_alpha);

draw_circle_color(0,0,5,make_color_rgb(16,32,64),make_color_rgb(32,32,32),false);

m1 = matrix_build(self.x, self.y, 0, 0, 0, image_angle, image_xscale, image_yscale, 1);
matrix_set(matrix_world,m1);

draw_circle_color(0,0,2,make_color_rgb(32,32,32),image_blend,false);

draw_set_color(_olcol);
draw_set_alpha(_olal);
matrix_set(matrix_world,mid);