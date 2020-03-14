/// @description Display Info
// You can write your code in this editor

_x = self.x - get_activecam_viewx();
_y = self.y - get_activecam_viewy();

if(global.oPlayer.oTarget!=noone)
	cdrawstrs(_x,_y,"itabselected: " + string(global.iTabSelectedAsteroid),
		"oPlayer.oTarget: " + string(object_get_name(global.oPlayer.oTarget.object_index)) );


cdrawstr(_x,_y+12, string(global.oMouseOverObj));


if(!global.ShowDebugInfo) 
	return;

_yy = _y;
_yinc = 16;

draw_circle_color(_x, _y,self.primitive_size+4, c_red, c_red, true);

draw_text(_x,_yy,"X,y: " + string(x) + "," + string(y)); _yy+=_yinc;
draw_text(_x,_yy,"primitive_size: " + string(primitive_size)); _yy+=_yinc;
draw_text(_x,_yy,"xscale,yscale: " + string(image_xscale) + "," + string(image_yscale)); _yy+=_yinc;
draw_text(_x,_yy,"image_angle: " + string(image_angle)); _yy+=_yinc;
draw_text(_x,_yy,"image_blend: " + string(image_blend)); _yy+=_yinc;
draw_text(_x,_yy,"image_alpha: " + string(image_alpha)); _yy+=_yinc;
draw_text(_x,_yy,"direction: " + string(direction)); _yy+=_yinc;
draw_text(_x,_yy,"speed: " + string(speed)); _yy+=_yinc;
