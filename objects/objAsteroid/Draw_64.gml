/// @description Display Info
// You can write your code in this editor

if(!global.ShowDebugInfo) 
	return;

_x = self.x - camera_get_view_x(view_camera[0]);
_y = self.y - camera_get_view_y(view_camera[0]);
_yy = _y;
_yinc = 16;

draw_circle_color(_x, _y,self.primitive_size, c_red, c_red, true);

draw_text(_x,_yy,"X,y: " + string(x) + "," + string(y)); _yy+=_yinc;
draw_text(_x,_yy,"primitive_size: " + string(primitive_size)); _yy+=_yinc;
draw_text(_x,_yy,"xscale,yscale: " + string(image_xscale) + "," + string(image_yscale)); _yy+=_yinc;
draw_text(_x,_yy,"image_angle: " + string(image_angle)); _yy+=_yinc;
draw_text(_x,_yy,"image_blend: " + string(image_blend)); _yy+=_yinc;
draw_text(_x,_yy,"image_alpha: " + string(image_alpha)); _yy+=_yinc;
draw_text(_x,_yy,"direction: " + string(direction)); _yy+=_yinc;
draw_text(_x,_yy,"speed: " + string(speed)); _yy+=_yinc;


