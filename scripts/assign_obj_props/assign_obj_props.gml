/////////////////////////////////////////////////////////////////////////////////////////////////
/// @function assign_obj_props(instance-id, {prop1}, ...)
/// @description assigns/creates the properties (variables) for an instance.
/// @param {instance-id} Instance
/////////////////////////////////////////////////////////////////////////////////////////////////
// ADDITIONAL INFO FOR USE:
/////////////////////////////////////////////////////////////////////////////////////////////////
// author: michael scott stuart (mikeypro83)
// email: michaelscottstuart@yahoo.com
// license: modified freeware, open-source: Original attribution of work is required for all
//			distributions of derived and original versions of this work. Failure to provide a
//			visible and apparent notice of original attribution defaults any derived work to a 
//			commercial license and therefore applicable fees will apply for licensing said work. 
//			(see commercial.txt)
/////////////////////////////////////////////////////////////////////////////////////////////////
{	
	if(argument_count>0)
		_inst = argument[0];
	else
		show_error("assign_obj_props(instance, prop1, ...): argument[0] is required.",true);
	if(instance_exists(_inst)==false)
		show_error("assign_obj_Props(instance, prop1, ...): argument[0] instance does not exist.", true);
	_argc=1;
	if(argument_count>_argc)
		_inst.Name = argument[_argc]; _argc++;
	if(argument_count>_argc)
		_inst.Desc = argument[_argc]; _argc++;
	if(argument_count>_argc)
		_inst.Type = argument[_argc]; _argc++;
	if(argument_count>_argc)
		_inst.Align = argument[_argc]; _argc++;
	if(argument_count>_argc)
		_inst.oCargoHold = argument[_argc]; _argc++;
	if(argument_count>_argc)
		_inst.DropCargoOnDeath = argument[_argc]; _argc++;
	if(argument_count>_argc)
		_inst.TakesDamage = argument[_argc]; _argc++;
	if(argument_count>_argc)
		_inst.Damage = argument[_argc]; _argc++;
	if(argument_count>_argc)
		_inst.LaserLevel = argument[_argc]; _argc++;
	if(argument_count>_argc)
		_inst.MaxSpeed = argument[_argc]; _argc++;
	if(argument_count>_argc)
		_inst.Actor = argument[_argc]; _argc++;
	return _inst;
}