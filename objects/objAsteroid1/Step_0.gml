/// @description Insert description here
// You can write your code in this editor
image_angle+=rotation_rate;

if(damage>=100)
{
	// TEST $$$$$$$$$$$$$$$$$$$$
	instance_create_layer(self.x-4,self.y-4,"Instances",objOreBit);	
	instance_create_layer(self.x+4,self.y,"Instances",objOreBit);
	instance_create_layer(self.x,self.y+4,"Instances",objOreBit);
	instance_create_layer(self.x,self.y,"Instances",objSingleExpandingPuff);
	// TEST $$$$$$$$$$$$$$$$$$$$$$$
	
	instance_destroy(self);	
	for (i = 0; i < global.asteroid_count; ++i)
	{	
		if( global.Asteroids[i] == self)
			global.Asteroids[i] = noone;
		if( global.oPlayer.oTarget == self)
			global.oPlayer.oTarget = noone;
	}

}

if(keyboard_check_released(global.keySelectNextObject))
{	
	/*
		This one was a lot of fun figuring out!!!
		
		Because EVERY asteroid is going to run this code on this keypress, 
		I was able to skip looping through arrays, and just do some
		clever checks to move the selection to the next on screen asteroid.		
	*/
	
	xp = camera_get_view_x(view_camera[0]);
	yp = camera_get_view_y(view_camera[0]);
	xxp = xp+camera_get_view_width(view_camera[0]);
	yyp = yp+camera_get_view_height(view_camera[0]);
		
	if (global.oPlayer.oTarget == self)
	{
		global.iTabSelectedAsteroid++;
		if(global.iTabSelectedAsteroid>=global.asteroid_count)
			global.iTabSelectedAsteroid=0;
		global.oPlayer.oTarget = noone;
		return;
	}
	
	if(global.oPlayer.oTarget == noone && global.Asteroids[global.iTabSelectedAsteroid]==self)
	{		
		if ( (x >= xp && x <= xxp && y >= yp && y <= yyp) )
			global.oPlayer.oTarget = self;
		else 
		{
			global.iTabSelectedAsteroid++;
			if(global.iTabSelectedAsteroid>=global.asteroid_count)
				global.iTabSelectedAsteroid=0;
		}
	}	
}

if(mouse_check_button_released(global.mouseSelectObjectButton))
{
	if(point_in_circle(mouse_x,mouse_y,self.x,self.y,primitive_size))
	{		
		global.oPlayer.oTarget = self;	
		i = 0;		
		while(i < global.asteroid_count)	// this sucks we have to go through all of the asteroids to do this...
		{
			_inst = global.Asteroids[i];
			if(_inst==self)
			{
				global.iTabSelectedAsteroid = i;
				break;
			}
			i++;
		}
	}
	else
	{		
		if(global.oPlayer.oTarget == self)
		{
			global.oPlayer.oTarget = noone;
		}
	}
}
