/// @description Insert description here

// TODO: Comment, and clean code. are all of these used?
//       make code look nice, I guess.. Explain things in comments ...

visible = true;
depth = 0;
_planet_rot = 0;
_cloud_rot = 0;
planet_image_w = 512;
planet_image_h = 512;
planet_size = 512.0;		// diameter

///////////////////////////////////////////////////////////////////////////////////////////
// PlanetTexture, CloudTexture
///////////////////////////////////////////////////////////////////////////////////////////
// USE: Child Objects can set these variables in their Create event to change the textures
//		they use to draw themselves, while their step and other events will handle how
//		they interact with the player and other objects. This base planet wont do anything
//		that any other planet wont do; they all derive from this one.
///////////////////////////////////////////////////////////////////////////////////////////

PlanetTexture = sprite_get_texture(sprPlanetM,0);
CloudTexture = sprite_get_texture(sprPlanetMClouds,0);



