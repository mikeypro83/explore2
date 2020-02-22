/// @description Insert description here
// You can write your code in this editor

image_xscale += 0.01;
image_yscale = image_xscale;
self.y-=0.9;
image_blend = make_color_rgb(_r,_g,_b);
image_alpha-=0.01;
if(image_alpha<=0)
	instance_destroy(self);
_r-=0.1;
_g-=0.1;
