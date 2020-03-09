/// @description Draw Stars
// You can write your code in this editor
{

	draw_save_state();

	_vx = get_activecam_viewx();
	_vy = get_activecam_viewy();
	_vw = get_activecam_vieww();
	_vh = get_activecam_viewh();

	_tex = sprite_get_texture(space1,0);	
	gpu_set_tex_repeat(true);

	draw_set_alpha(0.5);
	draw_primitive_begin_texture(pr_trianglestrip,_tex);

	_u = 0 + global.oPlayer.x / room_width;		// x component of texture pixel we want
	_v = 0 + global.oPlayer.y / room_height;	// y component of texture pixel we want
	_s = 3.0;	// in this case textures are 0.0 to 1.0, _s = _size of texture.
	draw_vertex_texture(_vx,_vy,			_u,		_v);
	draw_vertex_texture(_vx+_vw,_vy,		_u+_s,	_v);
	draw_vertex_texture(_vx,_vy+_vh,		_u,		_v+_s);
	draw_vertex_texture(_vx+_vw,_vy+_vh,	_u+_s,	_u+_s);
		
	draw_primitive_end();

	draw_restore_state();	
}
