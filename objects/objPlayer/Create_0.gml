/// @description Setup Default Properties
// You can write your code in this editor

create_obj_properties("Player");

x = window_get_width() / 2;
y = window_get_height() / 2;

image_xscale = 5.0;
image_yscale = 5.0;
image_blend = c_gray;

primitive_size = 6;

laser_level = 1;

max_speed = 8;	// forward & reverse

self.oTarget = noone;

CargoHold = instance_create_layer(x,y,"Hidden",objCargoHold);