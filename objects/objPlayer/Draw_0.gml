/// @description Primitive Draw
// You can write your code in this editor

// x,y,z,xrot,yrot,zroy,xscale,yscale,zscale
m1 = matrix_build(self.x, self.y, 0, 0, 0, image_angle, image_xscale, image_yscale, 1);
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

draw_primitive_begin(pr_trianglelist);
draw_vertex_color(_dxx - _hdsize-1, _dyy + _hdsize+1, c_dkgray, _dal);
draw_vertex_color(_dxx, _dyy - _hdsize-1, _dcol, _dal);
draw_vertex_color(_dxx + _hdsize+1, _dyy + _hdsize+1, c_dkgray, _dal);
draw_primitive_end();

draw_primitive_begin(pr_trianglelist);
draw_vertex_color(_dxx - _hdsize, _dyy + _hdsize, _dcol, _dal);
draw_vertex_color(_dxx, _dyy - _hdsize, _dcol, _dal);
draw_vertex_color(_dxx + _hdsize, _dyy + _hdsize, _dcol, _dal);
draw_primitive_end();

_qs = primitive_size/4;

draw_circle_color(_dxx-(1),_dyy,_qs+0.2,c_white,c_dkgray,false);


matrix_set(matrix_world,mid);


