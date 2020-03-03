/// @description Insert description here
// You can write your code in this editor

draw_save_state();

_x = self.x + camera_get_view_x(view_camera[0]);
_y = self.y + camera_get_view_y(view_camera[0]);

m1 = matrix_build(self.x,self.y,0.0,0.0,0.0,image_angle,image_xscale,image_yscale,1.0);
mid = matrix_build_identity();
matrix_set(matrix_world,m1);


_tex = sprite_get_texture(sprite0,0);
_ctex = sprite_get_texture(sprite1,0);

gpu_set_tex_repeat(true);

draw_primitive_begin_texture(pr_trianglefan,_tex);

_x=0;
_y=0;
_u=0;
_v=0;
_r=self.planet_size-16;	// radius
_angle = 0;
_point_count = 32;
_deg = 360 / _point_count;
draw_point(_x,_y);
_ty = texture_get_texel_height(_tex);
_tx = texture_get_texel_width(_tex);
for(i = 0; i < _point_count+1; i++)
{	
	_x = lengthdir_x(_r,_deg*i);
	_y = lengthdir_y(_r,_deg*i);
	_u = (_x+ lengthdir_y(_r,_deg*i)) / planet_image_w + _rot;
	_v =_y / planet_image_h + 0.5 - (_rot/2);	
	draw_vertex_texture(_x,_y,_u,_v);		
}

draw_primitive_end();

// CLOUD LAYER

draw_primitive_begin_texture(pr_trianglefan,_ctex);

_x=0;
_y=0;
_u=0;
_v=0;
_r=self.planet_size-16;	// radius
_angle = 0;
_point_count = 32;
_deg = 360 / _point_count;
draw_point(_x,_y);
_ty = texture_get_texel_height(_tex);
_tx = texture_get_texel_width(_tex);
for(i = 0; i < _point_count+1; i++)
{	
	_x = lengthdir_x(_r,_deg*i);
	_y = lengthdir_y(_r,_deg*i);
	_u = (_x+ lengthdir_y(_r,_deg*i)) / planet_image_w + _crot;
	_v =_y / planet_image_h + 0.5 - (_crot/2);	
	draw_vertex_texture(_x,_y,_u,_v);		
}

draw_primitive_end();
gpu_set_texrepeat(false);
draw_set_alpha(0.75);
draw_circle_color(-0.5,-0.5,_r+2,c_white,c_black,false);

matrix_set(matrix_world,mid);

draw_restore_state();