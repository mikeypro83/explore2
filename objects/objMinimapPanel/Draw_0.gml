/// @description Insert description here
// You can write your code in this editor
{
	event_inherited();

	// for GUI-like elements, we offset our position by the camera's view position in order
	// to use display pixel vectors.
	_mx = self.x+get_activecam_viewx();
	_my = self.y+get_activecam_viewy();
	m1 = matrix_build(_mx, _my, 0, 0, 0, 0, 1, 1, 1);
	// get an identity matrix for later.
	mid = matrix_build_identity();
	matrix_set(matrix_world,m1);	
	draw_save_state();

	// Default visual property values
	_xofs = 0;
	_yofs = get_fonth();
	_dsize = Size;
	MMYSize = Size - (get_fonth()+2);
	_hdsize = _dsize / 2;
	_hdsize = _dsize / 2;

	lels = layer_get_all_elements("Instances");

	for (i = 0; i < array_length_1d(lels); i++;)
	{
		if (layer_get_element_type(lels[i]) == layerelementtype_instance)
		{		
			// TYODO SWITCH OBJECT TYPE
			inst = layer_instance_get_instance(lels[i]);
			_x = _xofs + (inst.x / room_width) * Size;
			_y = _yofs + (inst.y / room_height) * MMYSize;
		
			if ( (_x > 1 && _x < Size) &&
				(_y > 1 && _y < MMYSize) )
				{		
					switch(inst.object_index)
					{
						case objPlayer: 
							draw_set_color(c_blue); 
							draw_circle(_x,_y,2,false);
							break;					
						case objAsteroid:
							if(inst==global.oPlayer.oTarget)
							{
								draw_set_color(c_yellow);
								draw_circle(_x,_y,2,true);
							}
							else
							{
								draw_set_color(c_white); 
								draw_point(_x,_y);
							}
							break;
						case objPlanet:
								draw_set_color(c_blue);
								draw_circle(_x,_y, (inst.planet_size/room_width)*Size,false);
								draw_set_color(c_green);
								draw_circle(_x,_y, (inst.planet_size/room_width)*Size,true);
						default:
							// do nothing
								/*draw_set_color(c_yellow); 
								draw_point(_x,_y);*/
							break;
					}
				}
		}
	}

	draw_restore_state();
	matrix_set(matrix_world,mid);
}
