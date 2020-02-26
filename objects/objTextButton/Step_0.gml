/// @description Button Logic & Mouse Input
// You can write your code in this editor
{
	_camx = camera_get_view_x(view_camera[view_current]);
	_camy = camera_get_view_y(view_camera[view_current]);
	MouseOver = point_in_rectangle(mouse_x,mouse_y,self.x+_camx,self.y+_camy,self.x+_camx+Size,self.y+_camy+get_fonth(Font));
	CheckForTopMouseOver(); // This will negate MouseOver if another obj is on top that has MouseOver
		
	if(MouseOver)
	{	
	
		if(mouse_check_button_pressed(mb_left))
			MouseLDown = true;
		else if(mouse_check_button_released(mb_left))
		{
			MouseLDown = false;
			MouseLRelease = true;
		}
		else
		{
			MouseLRelease=false;
		}
	}
	else
	{
		MouseOver=false;
		MouseLDown=false;
		MouseLRelease=false;
	}
}