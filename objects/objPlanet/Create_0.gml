/// @description Insert description here
// You can write your code in this editor
planet_image_w = 512;
planet_image_h = 512;
planet_size = 128.0;		// diameter

pid = global.pid++;

depth = -100;

_rot = 0;
_crot = 0;


/*

_surf = surface_create(planet_image_w,planet_image_h);
surface_set_target(_surf);
// getting back on it. .. didn't actually stop. 



_cells = array_create(planet_image_w * planet_image_h,0); // should work
_divider = 32;
_cellw = planet_image_w / _divider;
_cellh = planet_image_h / _divider;
_cellcountx = _divider;
_cellcounty = _divider;
_cells_size = planet_image_w * planet_image_h;
_delay = 0;
for(_y=0;_y<planet_image_h;_y++)
{
	for(_x=0;_x<planet_image_w;_x++)
	{	
		if(_delay==0)
		{
			_delay=irandom(10);
			_val = irandom(10);
		}
		if(_delay>0) _delay--;	
		_cells[(planet_image_w*_y)+_x] = _val;	// 0 - deep water, 1  - water, 2 - sand, 3 - dirt, 4 = grass, 5 = rock, 6 = snow
	}
}

for(_y=8;_y<planet_image_h-8;_y++)
{
	for(_x=8;_x<planet_image_w-8;_x++)
	{		
		_1 = _cells[ ((_y-1) * planet_image_w)	+ _x-1	];
		_2 = _cells[ ((_y-1) * planet_image_w)	+ _x		];
		_3 = _cells[ ((_y-1) * planet_image_w)	+ _x+1	];
		_4 = _cells[ (_y		* planet_image_w)	+ _x-1	];
		_5 = _cells[ (_y		* planet_image_w)	+ _x		];
		_6 = _cells[ ((_y+1) * planet_image_w)	+ _x-1	];
		_7 = _cells[ ((_y+1) * planet_image_w)	+ _x		];
		_8 = _cells[ ((_y+1) * planet_image_w)	+ _x+1	];
		_index = (planet_image_w*_y)+_x;		
		_cells[_index] = int64((_1+_2+_3+_4+_5+_6+_7+_8)/8);
		switch(_cells[_index])
		{
			case 0: draw_point_color(_x,_y,c_navy); break;
			case 1: draw_point_color(_x,_y,c_blue); break;
			case 2: draw_point_color(_x,_y,c_blue); break;
			case 3: draw_point_color(_x,_y,c_ltgray); break;
			case 4: draw_point_color(_x,_y,c_olive); break;
			case 5: draw_point_color(_x,_y,c_green); break;
			case 6: draw_point_color(_x,_y,c_green); break;
			case 7: draw_point_color(_x,_y,c_green); break;
			case 8: draw_point_color(_x,_y,c_gray); break;
			case 9: draw_point_color(_x,_y,c_gray); break;
			case 10: draw_point_color(_x,_y,c_white); break;
			default: draw_point_color(_x,_y,c_purple); break;
		}
	}
}

surface_reset_target();

*/





