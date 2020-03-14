/////////////////////////////////////////////////////////////////////////////////////////////////
/// @function CheckForTopMouseOver(instance-id)
/// @description Let's an object that uses the MouseOver variable determine wether or not
///	it is the top-most object and assigns global.oMouseOverObj accordingly, if neccessary
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
	if(argument_count != 1) show_error("CheckForTopMouseOver(instance-id): Requires one argument, instance-id of an object.",true);
	_inst = argument[0];
	if(instance_exists(_inst)==false) show_error("CheckForTopMouseOver(instance-id): argument[0] instance does not exist.",true);
	if(variable_instance_exists(_inst,"MouseOver")==false) show_error("CheckForTopMouseOver(instance-id): argument[0] instance does not have MouseOver variable.",true);
	if(_inst==noone||_inst==undefined) 
		return;

	// 
	// If oMouseOverObj is noone and the instance has MouseOver 
	// while the LMB is down then set it as the new oMouseOverObj
	//
	
	if(global.oMouseOverObj==noone &&_inst.MouseOver && global.LMBIsDown)
	{
		global.oMouseOverObj=_inst;
		global.oMouseOverObj.depth = global.GUIDepth-1;
		return;
	}
	
	//
	// If oMouseOverObj is not the instance and is not noone and the instance has MouseOver
	// Check it's depth
	if (global.oMouseOverObj!=_inst && global.oMouseOverObj!=noone && _inst.MouseOver)
	{
		//
		// If the mouse is NOT dragging (previous step had LMBDown) and LMB is down this step
		// then we can safely agree this object has been selected by the user and should be the 
		// new oMouseOverObj.		
		// 
		// Testing a new check:
		// if one panel is drawn and the other is not, we can safely agree the other is on top.
		//
		if(global.LMBIsHeld==false && global.LMBIsDown && _inst.depth < global.oMouseOverObj.depth)
		{
			// Reset the old oMouseOverObj variables
			global.oMouseOverObj.depth = global.GUIDepth;			
			global.oMouseOverObj.MouseOver=false;
			
			// Set the instance to the new oMouseOverObj and bring it to the front (GUIDepth-1).
			global.oMouseOverObj = _inst;
			global.oMouseOverObj.depth = global.GUIDepth-1;
		} else
		{
			// OTHERWISE --
			// -- If the mouse is dragging OR LMB has NOT been clicked
			// Reset the instance's MouseOver (and depth to be safe???) 
			_inst.MouseOver = false;
			//_inst.depth = global.GUIDepth;
		}
		
		// Maybe...
		// We don't want to process anymore this step.
		//return;
	}

	// UPDATE CURRENT OMouseOverObj MouseOver Status
	// -- Check current oMouseOverObj for MouseOver and set to noone if it's MouseOver has changed to false.
	// -- If the current oMouseOverObj is NOT visible also reset it to MouseOver is false.
	if(global.oMouseOverObj!=noone)
		if(global.oMouseOverObj.MouseOver==false || global.oMouseOverObj.visible==false)
		{
			global.oMouseOverObj.depth = global.GUIDepth;
			global.oMouseOverObj=noone;
		}

}