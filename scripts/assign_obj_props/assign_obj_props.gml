/////////////////////////////////////////////////////////////////////////////////////////////////
/// @description assign_obj_props
/// @param {string} Name
/// @param {string} Description [string or array-of-strings]
/// @param {global.align_type} Alignment 
/////////////////////////////////////////////////////////////////////////////////////////////////
// INFO:
//		Use this script to create and assign values for object properties that are to be used
//	(AND EXPECTED TO EXIST!!) for objects in the game. 
//		--- Call at the beginning of the object's Create Event, or after it's creation.
/////////////////////////////////////////////////////////////////////////////////////////////////
// author: michael scott stuart (mikeypro83)
// email: michaelscottstuart@yahoo.com
/////////////////////////////////////////////////////////////////////////////////////////////////
{	
	Name = "Obj" + string(object_index);
	Type = obj_type.None;
	Align = align_type.Nuetral;
	HasCargo = false;
	DropCargoOnDeath = false;
	oCargoHold = noone;	//instance_create_layer(0,0,"Hidden",objCargoHold);
	TakesDamage = false;
	Damage = 0;
	Desc = "No description.";

	if(argument_count>0)
		self.Name = argument[0];
	if(argument_count>1)
		self.Desc = argument[1];
	if(argument_count>2)
		self.Align = argument[2];
}