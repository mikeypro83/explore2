/// @description Insert description here
// You can write your code in this editor

// x,y,z,xrot,yrot,zroy,xscale,yscale,zscale
m1 = matrix_build(self.x + camera_get_view_x(view_camera[0]),self.y + camera_get_view_y(view_camera[0]), 0, 0, 0, image_angle, image_xscale, image_yscale, 1);
m2 = matrix_multiply(m1,matrix_get(matrix_world));
mid = matrix_build_identity();
matrix_set(matrix_world,m1);

// Default visual property values
_dxx = 0;//global.minimap_x;
_dyy = 0;//global.minimap_y;
_dsize = minimap_size;
_hdsize = _dsize / 2;
_hdsize = _dsize / 2;
_dcol = image_blend;
_dal = image_alpha;

_col = draw_get_color();
_al = draw_get_alpha();

_bgcol = make_color_rgb(32,32,32);
_c1 = make_color_rgb(64,64,64);
_c2 = make_color_rgb(128,128,128);
_c3 = make_color_rgb(96,96,96);
_c4 = make_color_rgb(64,64,128);

draw_set_color(_bgcol);

draw_rectangle(_dxx,_dyy,_dxx+minimap_size,_dyy+minimap_size,false);

draw_rectangle_color(_dxx,_dyy,_dxx+minimap_size,_dyy+minimap_size,_c1,_c2,_c3,_c4,true);

draw_set_color(c_white);

lels = layer_get_all_elements("Instances");


for (i = 0; i < array_length_1d(lels); i++;)
{
	if (layer_get_element_type(lels[i]) == layerelementtype_instance)
	{		
		// TYODO SWITCH OBJECT TYPE
		inst = layer_instance_get_instance(lels[i]);
		_x = (inst.x / room_width) * minimap_size;
		_y = (inst.y / room_height) * minimap_size;
		
		if ( (_x > 1 && _x < minimap_size) &&
			(_y > 1 && _y < minimap_size) )
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
							draw_circle(_x,_y, (inst.planet_size/room_width)*minimap_size,false);
							draw_set_color(c_green);
							draw_circle(_x,_y, (inst.planet_size/room_width)*minimap_size,true);
					default:
						// do nothing
							/*draw_set_color(c_yellow); 
							draw_point(_x,_y);*/
						break;
				}
			}
	}
}

draw_set_color(_col);
draw_set_alpha(_al);

matrix_set(matrix_world,mid);