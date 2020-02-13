/// @description Insert description here
// You can write your code in this editor

image_alpha -= _fadespeed;
image_xscale += _scalespeed;
image_yscale += _scalespeed;

if(image_alpha<=0)
	instance_destroy(self);
		