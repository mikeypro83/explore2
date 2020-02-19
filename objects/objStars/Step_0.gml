/// @description Insert description here
// You can write your code in this editor

if(Resize==true)
{
	ncamx = camera_get_view_x(view_camera[camera_get_active()]);
	ncamy = camera_get_view_y(view_camera[camera_get_active()]);
	ncamw = camera_get_view_width(view_camera[camera_get_active()]);
	ncamh = camera_get_view_height(view_camera[camera_get_active()]);
	for(i = 0; i < star_count; ++i)
	{
		star_xarray[i] = irandom_range(ncamx,ncamx+ncamw);
		star_yarray[i] = irandom_range(ncamy,ncamy+ncamh);
	}
	show_debug_message("WORKED");
	Resize=false;
}