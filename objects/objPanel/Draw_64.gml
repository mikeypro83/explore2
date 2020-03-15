/// @description Debug Stuff

_camx = self.x - get_activecam_viewx();
_camy = self.y - get_activecam_viewy();

cdrawstr(0,DebugY, 
	"`E"+ self.Name + " `F"+string(self.x) + ", " + string(self.y) + ", d=" + string(self.depth) +
		" mouseover="+string(self.MouseOver)+", self = " + string(self) + ", first = " + string(global.oFirstPanel) +
		", onext="+string(self.oNext));

