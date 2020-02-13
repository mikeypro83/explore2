/// @description Insert description here
// You can write your code in this editor

if(!global.ShowDebugInfo) 
	return;

_x = self.x - camera_get_view_x(view_camera[0]);
_y = self.y - camera_get_view_y(view_camera[0]);
_yy = _y;
_yinc = 16;

draw_circle_color(_x, _y,self.primitive_size+2, c_red, c_red, true);

_olcol = draw_get_color();
draw_set_color(c_red);
draw_circle(_x,_y,self.primitive_size,true);
draw_set_color(_olcol);
