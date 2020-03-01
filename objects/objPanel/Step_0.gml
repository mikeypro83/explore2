/// @description Insert description here
// You can write your code in this editor

	_camx = camera_get_view_x(view_camera[camera_get_active()]);
	_camy = camera_get_view_y(view_camera[camera_get_active()]);
		
	MouseOver = point_in_rectangle(mouse_x,mouse_y,x+_camx,y+_camy,x+_camx+Size,y+_camy+Size);	
	CheckForTopMouseOver();
	
	if(MouseOver&&mouse_check_button(mb_left))
	{
		self.x = mouse_x-(Size/2)-_camx;
		self.y = mouse_y-(Size/2)-_camy;
	}
	
	if(MouseOver==false&&global.oMouseOverObj==self)
		global.oMouseOverObj=noone;

