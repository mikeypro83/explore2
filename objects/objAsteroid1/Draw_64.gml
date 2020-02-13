/// @description Display Info
// You can write your code in this editor

if(!global.ShowDebugInfo) 
	return;

// Because we use matrices for drawing, we have to use them here in the GUI too.
//mw = matrix_get(matrix_world);
//m1 = matrix_build(self.x,self.y, 0, 0, 0, 0, 1, 1, 1);
//m2 = matrix_multiply(m1,matrix_get(matrix_world));
//mi = matrix_build_identity();
//matrix_set(matrix_world,m2);

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
//matrix_set(matrix_world,mw);

