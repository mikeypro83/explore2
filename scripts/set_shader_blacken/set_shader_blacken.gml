/////////////////////////////////////////////////////////////////////////////////////////////////
/// @description set_shader_blacken
/// @param {TextureID} Texture To use For Outlining
/////////////////////////////////////////////////////////////////////////////////////////////////
if( argument_count != 1 )
	show_error("set_shader_blacken: expected one parameter: texture pointer",false);
if( !is_ptr(argument[0]) )
	show_error("set_shader_blacken: texture is not a pointer: texture = " + string(argument[0]),false);
global.blacken_upixelH = shader_get_uniform(sh_blacken,"pixelH");
global.blacken_upixelW = shader_get_uniform(sh_blacken,"pixelW");
global.blacken_texelW = texture_get_texel_width(argument[0]);
global.blacken_texelH = texture_get_texel_height(argument[0]);
shader_set(sh_blacken);
shader_set_uniform_f(global.blacken_upixelW,global.blacken_texelW);
shader_set_uniform_f(global.blacken_upixelH,global.blacken_texelH);