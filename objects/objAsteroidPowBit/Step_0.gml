/// @description Insert description here
// You can write your code in this editor

//direction = image_angle+90;
image_angle+=4;

image_alpha = 1.0 - (killcount/killdelay);
killcount++;
speed -= speed-0.01 > 0 ? 0.01 : 0;

if(killcount>=killdelay)
	instance_destroy(self);

//////////////////////////////////////////
// VIEW BOUNDARY
//////////////////////////////////////////

xp = camera_get_view_x(view_camera[0]);
yp = camera_get_view_y(view_camera[0]);
xxp = xp+camera_get_view_width(view_camera[0]);
yyp = yp+camera_get_view_height(view_camera[0]);
if(  (self.x < xp || self.x > xxp) || (self.y < yp || self.y > yyp) )
	instance_destroy(self);
