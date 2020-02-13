/// @description Setup Stars
// You can write your code in this editor

self.Name = "Stars";

star_count = 1000;
star_xarray = array_create(star_count,1);
star_yarray = array_create(star_count,1);
star_carray = array_create(star_count,1);
for(i = 0; i < star_count; ++i)
{
	star_xarray[i] = irandom_range(0,room_width);
	star_yarray[i] = irandom_range(0,room_height);	
	star_carray[i] = choose(c_white,c_gray,c_ltgray,c_dkgray,c_blue,c_maroon,c_yellow);
}
 
depth = 1000;