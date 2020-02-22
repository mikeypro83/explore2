/// @description Setup Default Properties
// You can write your code in this editor

assign_obj_props("Player");

x = window_get_width() / 2;
y = window_get_height() / 2;

image_xscale = 1.0;
image_yscale = 1.0;
image_blend = c_gray;

primitive_size = 32;

laser_level = 1;

max_speed = 8;	// forward & reverse

self.oTarget = noone;

CargoHold = instance_create_layer(x,y,"Hidden",objCargoHold);

// CREATE IMAGE & SPRITE

_sw = primitive_size;
_sh = primitive_size;
_surf = surface_create(_sw,_sh);
surface_set_target(_surf);

// Default visual property values
_size = primitive_size;
_hsize = _size / 2;
_dcol = image_blend;
_dal = image_alpha;

draw_triangle(_hsize,0,_size,_size,0,_size,false);
//draw_primitive_begin(pr_trianglelist);
//draw_vertex_color(_dxx - _hdsize-1, _dyy + _hdsize+1, c_dkgray, _dal);
//draw_vertex_color(_dxx, _dyy - _hdsize-1, _dcol, _dal);
//draw_vertex_color(_dxx + _hdsize+1, _dyy + _hdsize+1, c_dkgray, _dal);
//draw_primitive_end();

//draw_primitive_begin(pr_trianglelist);
//draw_vertex_color(_dxx - _hdsize, _dyy + _hdsize, _dcol, _dal);
//draw_vertex_color(_dxx, _dyy - _hdsize, _dcol, _dal);
//draw_vertex_color(_dxx + _hdsize, _dyy + _hdsize, _dcol, _dal);
//draw_primitive_end();

_qs = primitive_size/4;

draw_circle_color(_hsize,_hsize,_qs+0.2,c_white,c_dkgray,false);

surface_reset_target();

sprite_index = sprite_create_from_surface(_surf,0,0,_sw,_sh,false,false,_sw/2,_sh/2);

