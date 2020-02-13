/// @description Insert description here
// You can write your code in this editor

self.Name = "Asteroid";
self.Number = -1;

CargoType = irandom_range(cargo_type.Silica,cargo_type.FrozenH20);

//selected_asteroid = false;
damage = 0;

image_xscale = 1.0;
image_yscale = 1.0;
image_blend = choose(c_gray, c_dkgray, c_ltgray);
rotation_rate = random_range(-1.0,1.0);

primitive_size = random_range(10,40);

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
