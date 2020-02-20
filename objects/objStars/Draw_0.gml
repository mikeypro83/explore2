/// @description Draw Stars
// You can write your code in this editor
{

	draw_save_alpha();

	for(i = 0; i < star_count; ++i)
	{
		//switch(star_carray[i])
		//{
		//	case c_ltgray:
		//		_x -= (global.oPlayer.x - star_xarray[i]) * 0.6;
		//		_y -= (global.oPlayer.y - star_yarray[i]) * 0.6;
		//	break;		
		//	case c_gray:
		//		_x -= (global.oPlayer.x - star_xarray[i]) * 0.4;
		//		_y -= (global.oPlayer.y - star_yarray[i]) * 0.4;
		//	break;		
		//	case c_dkgray:
		//		_x -= (global.oPlayer.x - star_xarray[i]) * 0.1;
		//		_y -= (global.oPlayer.y - star_yarray[i]) * 0.1;			
		//	break;
		//	default:
		//		_x -= (global.oPlayer.x - star_xarray[i]) * 0.02;
		//		_y -= (global.oPlayer.y - star_yarray[i]) * 0.02;			
		//		break;
		//}
		ncamx = camera_get_view_x(view_camera[camera_get_active()]);
		ncamy = camera_get_view_y(view_camera[camera_get_active()]);
		ncamw = camera_get_view_width(view_camera[camera_get_active()]);
		ncamh = camera_get_view_height(view_camera[camera_get_active()]);
		
		camx = ncamx;
		camy = ncamy;
		camw = ncamw;
		camh = ncamh;
	
		_x = star_xarray[i];
		_y = star_yarray[i];
		//if(_x>camx+camw) _x = camx;s
		//if(_x<camx) _x = camx+camw;
		//if(_y>camy+camh) _y = camy;
		//if(_y<camy) _y = camy+camh;	
		//star_xarray[i]=_x;
		//star_yarray[i]=_y;
	
		//if(i==0)
		//show_debug_message("star 0 = " + string(_x)+", " + string(_y));
		
		draw_set_alpha(0.6);
		draw_point_color(camx+ _x, camy+_y, star_carray[i]);	
	}
	
	draw_restore_alpha();
}