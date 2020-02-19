/// @description Setup Stars
// You can write your code in this editor

self.Name = "Stars";

star_count = 100;
star_xarray = array_create(star_count,1);
star_yarray = array_create(star_count,1);
star_carray = array_create(star_count,1);
for(i = 0; i < star_count; ++i)
{
	star_xarray[i] = irandom_range(0,view_get_wport(view_current));
	star_yarray[i] = irandom_range(0,view_get_hport(view_current));	
	star_carray[i] = choose(c_white,c_gray,c_ltgray,c_dkgray,c_blue,c_maroon,c_yellow);
}
 
camx = camera_get_view_x(view_camera[camera_get_active()]);
camy = camera_get_view_y(view_camera[camera_get_active()]);
camw = camera_get_view_width(view_camera[camera_get_active()]);
camh = camera_get_view_height(view_camera[camera_get_active()]);
 
depth = 1000;

Resize = false;