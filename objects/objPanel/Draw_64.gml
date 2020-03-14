/// @description Insert description here
// You can write your code in this editor

_camx = self.x - camera_get_view_x(view_camera[camera_get_active()]);
_camy = self.y - camera_get_view_y(view_camera[camera_get_active()]);

cdrawstr(0,DebugY, 
	"`E"+ self.Name + " `F"+string(self.x) + ", " + string(self.y) + ", d=" + string(self.depth) +
		" mouseover="+string(self.MouseOver)+", self = " + string(self) + ", first = " + string(global.oFirstPanel) +
		", onext="+string(self.oNext));

