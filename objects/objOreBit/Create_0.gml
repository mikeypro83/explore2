/// @description Insert description here
// You can write your code in this editor
{
	// TODO: assign_ore_props ???????? or assign_object_props ???? both??!?!
	
	Quantity = 0;	// This could be count or normally, Tonnage
	CargoType = irandom_range(0, cargo_type.CargoCount-1); // TODO: BETTER
		
	image_blend = image_blend == 0 ? c_gray : image_blend;		// if set after creating the instance..
	image_alpha = image_alpha == 0.0 ? 1.0 : image_alpha;		// if set after creating the instance..
	
	speed = random_range(-0.075,0.075);
	direction = random_range(0,359);
	
	///       ||
	///       || --  this is one big mess of garbage coding. but.. it looks cool in-game.
	///       \/     most likely pull off a better effect with less code, but meh, it works.
	
	shape_angles = array_create(6,0);
	shapes = array_create(6,0);
	shape_count = array_length_1d(shapes);
	_angle = 16;
	primitive_size = 6.0;
	for(i = 0; i < shape_count; ++i)
	{
		shapes[i] = irandom_range(1.0,primitive_size);	
		_angle*=2;
		shape_angles[i] = _angle;
	}
	Quantity = shapes[0];

	_surfw = primitive_size*2;
	_surfh = primitive_size*2;
	_surf = surface_create(_surfw,_surfh);
	surface_set_target(_surf);

	_ocol = draw_get_color();
	_oal = draw_get_alpha();
	_al = 1.0;
	_hsize = primitive_size/2;

	for(i = 0; i < shape_count; ++i)
	{	
		if(i>1)draw_set_alpha(0.5);
		m1 = matrix_build(_hsize, _hsize, 0, 0, 0, image_angle+shape_angles[i], image_xscale, image_yscale, 1);
		matrix_set(matrix_world,m1);
		draw_rectangle(-shapes[i],-shapes[i],shapes[i],shapes[i],false);
		matrix_set(matrix_world,matrix_build_identity());
	}

	draw_set_color(_ocol);
	draw_set_alpha(_oal);
	surface_reset_target();
	self.sprite_index = sprite_create_from_surface(_surf,0,0,_surfw,_surfh,false,false,_surfw/2,_surfh/2);
}