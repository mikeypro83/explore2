/// @description Primitive Draw
// You can write your code in this editor

// x,y,z,xrot,yrot,zroy,xscale,yscale,zscale
m1 = matrix_build(self.x,self.y, 0, 0, 0, image_angle, image_xscale, image_yscale, 1);
m2 = matrix_multiply(m1,matrix_get(matrix_world));
mid = matrix_build_identity();
matrix_set(matrix_world,m1);

// Default visual property values
_dxx = 0;
_dyy = 0;
_dsize = primitive_size;
_hdsize = _dsize / 2;
_hdsize = _dsize / 2;
_dcol = image_blend;
_dal = image_alpha;

_olcol = draw_get_color();
_olal = draw_get_alpha();

// draw_roundrect has specific functions to set color and alpha..
draw_set_color(image_blend);
draw_set_alpha(image_alpha);

_cdark = make_color_rgb(32,32,32);

draw_circle_color(_dxx,_dyy,_hdsize+(_hdsize/2),image_blend,_cdark,false);

draw_set_alpha(0.05);

for(i=0;i<shape_count;++i)
{
	switch(shape_tarray[i])
	{
		case 0:
			draw_set_alpha(0.05);
			draw_circle_color(_dxx+shape_xarray[i],_dyy+shape_yarray[i],shape_sarray[i],c_black,image_blend,false);
			break;
		case 1:
		draw_set_alpha(0.05);
			draw_circle_color(_dxx+shape_xarray[i],_dyy+shape_yarray[i],shape_sarray[i],image_blend,c_black,false);
			break;
	}
}	

draw_set_alpha(0.05);

// Draw Surface Craters
for(i = 0; i < dot_count; ++i)
{	
	draw_circle_color(_dxx + dot_xarray[i], _dyy + dot_yarray[i], 2, c_black, image_blend,false);
}


draw_set_color(_olcol);
draw_set_alpha(_olal);


if(global.oPlayer.oTarget==self)
{
	m1 = matrix_build( 0, 0, 0, 0, 0, 0, image_xscale, image_yscale, 1);
	matrix_set(matrix_world,m1);	
	draw_roundrect(self.x-primitive_size,self.y-primitive_size,self.x+primitive_size,self.y+primitive_size,true);
}

matrix_set(matrix_world,mid);