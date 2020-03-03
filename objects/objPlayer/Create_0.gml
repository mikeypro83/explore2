/// @description Setup Default Properties
// You can write your code in this editor
{	
	assign_obj_props("Player");

	image_xscale = 1.0;
	image_yscale = 1.0;
	image_blend = c_gray;

	primitive_size = 42;

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
	_qs = primitive_size/4;
	_dcol = image_blend;
	_dal = image_alpha;

	draw_save_state();
	draw_set_color(c_dkgray);
	draw_triangle(_hsize,0,_size,_size,0,_size,false);
	draw_set_color(image_blend);
	draw_triangle(_hsize,0+2,_size-2,_size-2,0+2,_size-2,false);
	draw_set_color(c_ltgray);
	draw_triangle(_hsize,0+8,_size-6,_size-6,0+6,_size-6,false);

	draw_set_color(c_maroon);
	draw_roundrect(0,				_size-3,		_size,	_size, false );
	//draw_roundrect(_size-_size/3,	_size-4,		_size,		_size, false );	

	draw_set_color(c_dkgray);
	draw_triangle(_hsize,1, _hsize+_qs-4,_qs+_qs,  _qs+4,_qs+_qs,false);

	draw_set_color(c_fuchsia);
	draw_triangle(_hsize-4,_qs/2, _hsize+4,_qs, _hsize,_qs ,false);


	draw_circle_color(_hsize,_hsize+5,_qs/1.2,c_white,c_dkgray,false);
	draw_set_alpha(0.25);
	draw_circle_color(_hsize,_hsize+5,_qs/1.2,c_white,c_blue,false);
	draw_set_alpha(1);
	draw_circle_color(_hsize,_hsize+5,_qs/1.2,c_dkgray,c_dkgray,true);
	draw_set_color(c_dkgray);
	draw_rectangle_color(_hsize-6, _size-10,  _hsize+7, _size-4, 
		c_ltgray, c_ltgray, c_dkgray,c_dkgray, false );
	draw_rectangle_color(_hsize-6, _size-10,  _hsize+7, _size-4, 
		c_gray, c_gray, c_dkgray,c_dkgray, true );

	surface_reset_target();
	draw_restore_state();

	sprite_index = sprite_create_from_surface(_surf,0,0,_sw,_sh,false,false,_sw/2,_sh/2);
}
