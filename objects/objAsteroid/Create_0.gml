/// @description Insert description here
/*
	
	-- Asteroid images are now generated in create. Then turned into a sprite for drawing.
	   This gives a massive performance boost not having to draw all the primitives.
		
*/

{
	
	// TODO: assign_asteroid_props script ?? or is it assign_object_props script ??? DESIGN IT!
	
	// TODO: Generate non-circular asteroids

	Name = "Asteroid";		// ?? Type name??
	Damage = 0;				// was damage

	// create a random cargo drop for this asteroid for when it is destroyed
	CargoType = irandom_range(cargo_type.Silica,cargo_type.FrozenH20);

	///////////////////////////////////////////////////////////////////////////////
	// generate asteroid sprite
	///////////////////////////////////////////////////////////////////////////////

	// graphics setup
	image_xscale = 1.0;
	image_yscale = 1.0;
	image_blend = choose(c_gray, c_ltgray, c_aqua);
	rotation_rate = random_range(-1.0,1.0);
	primitive_size = random_range(10,40);			// WARNING: THIS GETS USED BY objLaserPew 
													// FOR COLLISION DETECTION!!!

	// This code creates extra shapes to make asteroids look unique and "interesting"
	_halfsize = primitive_size / 2;
	shape_count = irandom_range(primitive_size/2,primitive_size);
	shape_xarray = array_create(shape_count,1);
	shape_yarray = array_create(shape_count,1);
	shape_sarray = array_create(shape_count,1);
	shape_tarray = array_create(shape_count,1);
	t = false;
	for(i = 0; i < shape_count; ++i)
	{
		shape_xarray[i] = random_range(-(_halfsize),(_halfsize));
		shape_yarray[i] = random_range(-(_halfsize),(_halfsize));
		shape_sarray[i] = random_range(4,(_halfsize));
		shape_tarray[i] = t ? 0 : 1;
		t = !t;
	}

	// This code creates the dots that speckle the asteroids
	dot_count = irandom_range(10,40);
	dot_xarray = array_create(dot_count, 1);
	dot_yarray = array_create(dot_count, 1);
	for(i = 0; i < dot_count; ++i)
	{
		nx = random_range(-_halfsize,_halfsize);
		ny = random_range(-_halfsize,_halfsize);
		for(ii = 0; ii < dot_count; ++ii)
		{
			if(distance_between_points(dot_xarray[ii], dot_yarray[ii],nx,ny) < 4)
			{
				nx = random_range(-_halfsize,_halfsize);
				ny = random_range(-_halfsize,_halfsize);		
			}
		}
		dot_xarray[i] = nx;
		dot_yarray[i] = ny;	
	}

	// create surface to create sprite from
	_surfw = 4+(primitive_size*4);
	_surfh = 4+(primitive_size*4);
	_surf = surface_create(_surfw,_surfh);
	surface_set_target(_surf);
	// don't need to setup a matrix...
	// Default visual property values
	_x = _surfw/2;	// start drawing in center of image
	_y = _surfh/2;  // /\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\
	_size = primitive_size;
	_hsize = primitive_size / 2;
	_dcol = image_blend;
	_dal = image_alpha;

	_olcol = draw_get_color();
	_olal = draw_get_alpha();

	// draw_roundrect has specific functions to set color and alpha..
	draw_set_color(image_blend);
	draw_set_alpha(image_alpha);

	_cdark = make_color_rgb(32,32,32);

	draw_set_alpha(1);
	draw_circle_color(_x,_y,_hsize+(_hsize/2),image_blend,c_gray,false);

	draw_set_alpha(0.5);

	for(i=0;i<shape_count;++i)
	{
		switch(shape_tarray[i])
		{
			case 0:
				draw_set_alpha(0.05);
				draw_circle_color(_x+shape_xarray[i],_y+shape_yarray[i],shape_sarray[i],c_black,image_blend,false);
				break;
			case 1:
			draw_set_alpha(0.05);
				draw_circle_color(_x+shape_xarray[i],_y+shape_yarray[i],shape_sarray[i],image_blend,c_black,false);
				break;
		}
	}	

	draw_set_alpha(0.05);

	// Draw Surface Craters
	for(i = 0; i < dot_count; ++i)
	{	
		draw_circle_color(_x + dot_xarray[i], _y + dot_yarray[i], 2, c_black, image_blend,false);
	}

	draw_set_alpha(0.025);
	draw_circle_color(_x,_y,_hsize+(_hsize/2),image_blend,_cdark,false);

	draw_set_color(_olcol);
	draw_set_alpha(_olal);

	surface_reset_target();

	self.sprite_index = sprite_create_from_surface(_surf,0,0,_surfw,_surfh,false,false,_surfw/2,_surfh/2);
}


