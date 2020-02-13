/// @description Draw Stars
// You can write your code in this editor

for(i = 0; i < star_count; ++i)
{
	_x = star_xarray[i];
	_y = star_yarray[i];
	switch(star_carray[i])
	{
		case c_ltgray:
			_x -= (global.oPlayer.x - star_xarray[i]) * 0.6;
			_y -= (global.oPlayer.y - star_yarray[i]) * 0.6;
		break;		
		case c_gray:
			_x -= (global.oPlayer.x - star_xarray[i]) * 0.4;
			_y -= (global.oPlayer.y - star_yarray[i]) * 0.4;
		break;		
		case c_dkgray:
			_x -= (global.oPlayer.x - star_xarray[i]) * 0.1;
			_y -= (global.oPlayer.y - star_yarray[i]) * 0.1;			
		break;
		default:
			_x -= (global.oPlayer.x - star_xarray[i]) * 0.02;
			_y -= (global.oPlayer.y - star_yarray[i]) * 0.02;			
			break;
	}
	draw_point_color(_x, _y, star_carray[i]);
}