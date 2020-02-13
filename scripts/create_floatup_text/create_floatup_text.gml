/////////////////////////////////////////////////////////////////////////////////////////////////
/// @description create_floatup_text(x, y, text, {instance layer:optional} )
/// @param {real} X X-position to start drawing text
/// @param {real} Y Y-position to start drawing text
/// @param {string} Text String
/// @param {string} Instance Layer Name (Optional)
/////////////////////////////////////////////////////////////////////////////////////////////////
// ADDITIONAL INFO FOR USE:
/////////////////////////////////////////////////////////////////////////////////////////////////
// author: michael scott stuart (mikeypro83)
// email: michaelscottstuart@yahoo.com
// license: modified freeware, open-source: Original attribution of work required for all
//			distributions of derived and original versions of this work.
/////////////////////////////////////////////////////////////////////////////////////////////////
_txtfloatupinst = noone;
if(argument_count<3) show_error("create_floatup_text: argument_count is at least three (3)",false);
if(argument_count==4)
	_txtfloatupinst = instance_create_layer(argument[0],argument[1],argument[3],objFloatUpText);
if(argument_count==3)
	_txtfloatupinst = instance_create_layer(argument[0],argument[1],"Instances",objFloatUpText);
_txtfloatupinst.Text = "`["+argument[2]+"`]"; // text
