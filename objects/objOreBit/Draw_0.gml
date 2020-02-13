/// @description Insert description here
// You can write your code in this editor

// x,y,z,xrot,yrot,zroy,xscale,yscale,zscale
m1 = matrix_build(self.x, self.y, 0, 0, 0, image_angle, image_xscale, image_yscale, 1);
m2 = matrix_multiply(m1,matrix_get(matrix_world));
mid = matrix_build_identity();
matrix_set(matrix_world,m1);
_ocol = draw_get_color();
_oal = draw_get_alpha();
_al = 1.0;
for(i = 0; i < shape_count; ++i)
{
	
	if(i>1)draw_set_alpha(0.5);
	m1 = matrix_build(self.x, self.y, 0, 0, 0, image_angle+shape_angles[i], image_xscale, image_yscale, 1);
	matrix_set(matrix_world,m1);
	draw_rectangle(-shapes[i],-shapes[i],shapes[i],shapes[i],false);
}

draw_set_color(_ocol);
draw_set_alpha(_oal);

matrix_set(matrix_world,mid);