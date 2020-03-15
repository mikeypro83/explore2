/// @description Insert description here
// You can write your code in this editor

// direction is always +90 of image angle if you use image_angle up = 0 deg
// because gm:s2 uses image_angle right -> = 0 deg
direction = image_angle + 90;

pulse_b+=16;
pulse_g+=16;

image_blend = make_color_rgb(pulse_r,pulse_g,pulse_b);


//////////////////////////////////////////
// ASTEROID COLLISIONS
//////////////////////////////////////////

_x = self.x;
_y = self.y;

//////////////////////////////////////////
// instance_nearest is a god-send
//////////////////////////////////////////

//////////////////////////////////////////
// Asteroid Collisions w/laser pew
//////////////////////////////////////////

_inst = instance_nearest(_x,_y, objAsteroid);
if(_inst != noone)
{
	if(distance_between_points(self.x,self.y,_inst.x,_inst.y) < _inst.primitive_size)
	{
		instance_create_layer(self.x,self.y,"Instances",objAsteroidPow);
		_inst.Damage += self.laser_power;		
		instance_destroy(self);
		return;
	}
}


//////////////////////////////////////////
// VIEW BOUNDARY
//////////////////////////////////////////

if ( is_outside_view(self, camera_get_active()) )
	instance_destroy(self);

//xp = camera_get_view_x(view_camera[0]);
//yp = camera_get_view_y(view_camera[0]);
//xxp = xp+camera_get_view_width(view_camera[0]);
//yyp = yp+camera_get_view_height(view_camera[0]);
//if(  (self.x < xp || self.x > xxp) || (self.y < yp || self.y > yyp) )
//	instance_destroy(self);