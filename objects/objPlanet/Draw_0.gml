/// @description Draw The Planet in the PlanetView Portion of the Game
/// A sphere mapped planet thing.

// SETUP

/////////////////////////////////////////////////////////////////////////////////////////////////////////
// Call draw_save_state() to save current draw state. See draw_save_state() to see what is being saved
// and if it is important to you. (It may not be neccessary for you to use it)
/////////////////////////////////////////////////////////////////////////////////////////////////////////
draw_save_state();

// SO I decided that building a matrix to define the location I am drawing to makes life easier in gm:studio2
// I'm not sure exactly why I thought that. But that is what this does.

_x = self.x + camera_get_view_x(view_camera[0]);
_y = self.y + camera_get_view_y(view_camera[0]);
m1 = matrix_build(self.x,self.y,0.0,0.0,0.0,image_angle,image_xscale,image_yscale,1.0);
mid = matrix_build_identity();
matrix_set(matrix_world,m1);

/////////////////////////////////////////////////////////////////////////////////////////////////////////
// Retrieve the textures and Set texture parameters before using texturing.
/////////////////////////////////////////////////////////////////////////////////////////////////////////
//_tex = sprite_get_texture(sprPlanetM,0);
//_ctex = sprite_get_texture(sprPlanetMClouds,0);
gpu_set_tex_repeat(true);


// #########################################################
// ####### Draw the Planet primitive first w/Texture #######
// #########################################################
// I am not commenting on this as most of it is hacknslash
// programming. HOWEVER, I did find out that sphere mapping
// coordinates u/v = asin(Nx/Ny)/PI + 0.5 Nx and Ny are 
// normal coordinates, so 0.0 - 1.0, which you can get the
// value of by dividng the value of x by the textures width 
// and the value of y by the textures height.
// That is all that needs to be said.
// #########################################################

draw_primitive_begin_texture(pr_trianglefan, PlanetTexture);

_x=0;
_y=0;
_u=0;
_v=0;
_r=self.planet_size-16;	// radius
_angle = 0;
_point_count = 64;
_deg = 360 / _point_count;
draw_point(_x,_y);
_ty = texture_get_texel_height(PlanetTexture);
_tx = texture_get_texel_width(PlanetTexture);
for(i = 0; i < _point_count+1; i++)
{		
	_x = (lengthdir_x(_r,_deg*i));// / planet_image_w;
	_y = (lengthdir_y(_r,_deg*i));// / planet_image_h;
	//_u = (_x / planet_image_w) - _crot;
	//_v = (_y / planet_image_h) - _crot;
	_u = _planet_rot + ((_x / planet_image_w)/2+ 0.5);
	_v = (_planet_rot/2) + ((_y / planet_image_h)/2 + 0.5);
	draw_vertex_texture(_x,_y,_u,_v);		
}

draw_primitive_end();

// ###################################################
// ####### Draw the Clouds primitive w/Texture #######
// ###################################################
// The cloud layer is drawn the same but the cloud
// Texture itself uses alpha for transparency. 
// Oh but the movement is done by _cloud_rot, whereas
// with the planet it's rotation is added using
// _planet_rot, both numbers are incremented in STEP
// by different amounts to give that offset rotation
// look so can see them moving seperately.
// ###################################################

draw_primitive_begin_texture(pr_trianglefan, CloudTexture);

_x=0;
_y=0;
_u=0;
_v=0;
_r=self.planet_size-16;	// radius
_angle = 0;
_point_count = 64;
_deg = 360 / _point_count;
draw_point(_x,_y);
_ty = texture_get_texel_height(CloudTexture);
_tx = texture_get_texel_width(CloudTexture);
for(i = 0; i < _point_count+1; i++)
{	
	_x = (lengthdir_x(_r,_deg*i));// / planet_image_w;
	_y = (lengthdir_y(_r,_deg*i));// / planet_image_h;
	//_u = (_x / planet_image_w) - _crot;
	//_v = (_y / planet_image_h) - _crot;
	_u = _cloud_rot + ((_x / planet_image_w)/2 + 0.5);
	_v = (_cloud_rot/2) + ((_y / planet_image_h)/2 + 0.5);
	draw_vertex_texture(_x,_y,_u,_v);			
}

draw_primitive_end();
gpu_set_texrepeat(false);
draw_set_alpha(0.75);
draw_circle_color(-0.5,-0.5,_r+(_r/10),c_white,c_black,false);

matrix_set(matrix_world,mid);

draw_restore_state();