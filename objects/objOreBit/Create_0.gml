/// @description Insert description here
// You can write your code in this editor

Quantity = 0;	// This could be count or normally, Tonnage
CargoType = irandom_range(0, cargo_type.CargoCount-1); // TODO: BETTER
image_blend = c_gray;
image_alpha = 1.0;
speed = random_range(-0.075,0.075);
direction = random_range(0,359);
shape_angles = array_create(6,0);
shapes = array_create(6,0);
shape_count = array_length_1d(shapes);
_angle = 16;
primitive_size = 6.0;
for(i = 0; i < shape_count; ++i)
{
	shapes[i] = irandom_range(4.0,primitive_size);	
	_angle*=2;
	shape_angles[i] = _angle;
}
Quantity = shapes[0];

