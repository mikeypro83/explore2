// TODO: PUT IN SCRIPT SO THE "ASTEROID ROOM" CAN RANDOM-GENERATE ASTEROIDS/ENEMIES/LOOT
// \/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/

global.asteroid_count = 100; //irandom_range(50,100);
global.Asteroids = array_create(global.asteroid_count,noone);

for(i = 0; i < global.asteroid_count; ++i)
{
	nx = irandom(4096);
	ny = irandom(4096);
	timeoutcount = 0;
	for(ii = 0; ii < global.asteroid_count; ++ii)
	{		
		if(global.Asteroids[ii]!=noone)
		{			
			if (distance_between_points(global.Asteroids[ii].x, global.Asteroids[ii].y, nx, ny) < 
					(global.Asteroids[ii].primitive_size*2) ||
					(nx<128||nx>room_width-128||ny<128||ny>room_height-128) )
			{
				nx = irandom(4096);
				ny = irandom(4096);
				ii = 0;
				timeoutcount++;
			}
		}
		
		if(timeoutcount> 500000)
		{
			show_debug_message("** ASTEROID CREATION TIMEOUT LIMIT REACHED (" + string(timeoutcount) + " of 500000)");
			game_end();
			break;
		}
	}
	global.Asteroids[i] = instance_create_layer( nx, ny, "Instances", objAsteroid );
	global.Asteroids[i].Number = i;
}