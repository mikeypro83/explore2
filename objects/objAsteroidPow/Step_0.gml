/// @description Insert description here
// You can write your code in this editor

direction = image_angle+90;

killcount++;

if(killcount>=killdelay)
	instance_destroy(self);
