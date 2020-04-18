/// @description Math Update & Input
// You can write your code in this editor

/////////////////////////////////////////
// TESTING/DEBUGGING CRAP
/////////////////////////////////////////

if(global.oQuitButton.MouseOver && global.LMBIsReleased)
	game_end();

/////////////////////////////////////////
// Global Input Updates
/////////////////////////////////////////

MouseUpdate();

/////////////////////////////////////////
// INPUT CONTROLS
/////////////////////////////////////////


if(keyboard_check_released(global.keyToggleCargoPanel))
{
	global.oCargoHoldPanel.oCargoHold = self.oCargoHold;
	global.ShowCargoPanel = !global.ShowCargoPanel;
	global.oCargoHoldPanel.visible = global.ShowCargoPanel;
}

if(keyboard_check_released(global.keyToggleHelpScreen))
{
	global.ShowHelpScreen = !global.ShowHelpScreen;
	global.oHelpScreen.visible = global.ShowHelpScreen;
}

global.WindowResized = false;

if(keyboard_check_released(global.keyToggleFullscreen))
{	
	//global.PrevViewW = get_activecam_vieww();
	//global.PrevViewH = get_activecam_viewh();
	global.IsFullscreen = !global.IsFullscreen;
	window_set_fullscreen(global.IsFullscreen);		
	
	
	if(global.IsFullscreen)
	{
		// WARNING: FOR SOME REASON view_camera[0] IS NOT THE SAME AS camera_get_active() 
		// BUT THEY BOTH, BY DEFAULT, AFFECT THE SCREEN, BUT ONLY view_camera[0] affects
		// it CORRECTLY. dangit!
		//
		camera_set_view_size(view_camera[0], display_get_width(),display_get_height());
		surface_resize(application_surface,display_get_width(),display_get_height());		
	}
	else
	{
		camera_set_view_size(view_camera[0],view_wport[0],view_hport[0]);
		surface_resize(application_surface,view_wport[0],view_hport[0]);
	}	
	
	global.WindowResized = true;
}

if(keyboard_check_released(global.keyToggleDebugInfo))
	global.ShowDebugInfo = !global.ShowDebugInfo;	

if(keyboard_check(global.keyTurnLeft))
	image_angle++;
if(keyboard_check(global.keyTurnRight))
image_angle--;
if(keyboard_check(global.keyAccelerate))
	speed += speed < max_speed ? 0.05 : 0;
if(keyboard_check(global.keyDeccelerate))
	speed -= speed > -max_speed ? 0.05 : 0;

if(keyboard_check_released(global.keyUse))
{
	las = instance_create_layer(self.x,self.y,"Instances",objLaserPew);
	_x = lengthdir_x(self.primitive_size, las.direction);
	_y = lengthdir_y(self.primitive_size, las.direction);
	las.x = self.x;//+_x - (primitive_size/2);
	las.y = self.y;//+_y - (primitive_size/2);
	las.oOwner = self;
	las.image_angle = self.image_angle;
	las.direction = self.direction;
	las.speed = self.speed + (las.max_speed);	
}

/////////////////////////////////////////
// ROOM WRAP
/////////////////////////////////////////

if(self.x < 0)
	self.x = room_width-1;
if(self.x > room_width)
	self.x = 1;
	
if(self.y < 0)
	self.y = room_height-1;
if(self.y > room_height)
	self.y = 1;

// gmstudio2's movement direction has 0 degs pointing true right, so we have to adjust for that.
direction = image_angle + 90;


/////////////////////////////////////////
// Collisions w / global.Asteroids
/////////////////////////////////////////

//_inst = instance_nearest(self.x,self.y, objAsteroid);

//if(_inst != noone)
//{
		//sprite_
		//if (distance_between_points(self.x,self.y,_inst.x,_inst.y) < 
		//	(self.primitive_size+4) + _inst.primitive_size)
		//{			
		//	// Not the most accurate, but it does the job and I came up
		//	// with everything myself, so there!
		//	// NOTE: It wont take into account any of the scaling
		//	while(distance_between_points(self.x,self.y,_inst.x,_inst.y) < 
		//		(self.primitive_size+4) + _inst.primitive_size)
		//	{
		//		// take a scaled down "distance" to move the
		//		// player out of the collision a little each loop.
		//		self.x -= (_inst.x - self.x) * 0.1;
		//		self.y -= (_inst.y - self.y) * 0.1;
		//	}

		//	self.speed = 0; //-self.speed;
		//	//self.direction = -self.direction;
		//}
//}

//////////////////////////////////////////
// Player Collision w/objOreBits
//////////////////////////////////////////

//_inst = instance_nearest(self.x,self.y, objOreBit);
//if(_inst != noone)
//{

//}
