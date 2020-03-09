/////////////////////////////////////////////////////////////////////////////////////////////////
/// @description add_to_cargohold
/// @param {real} ObjectID of objCargoHold
/// @param {cargo_type} Cargo Type Enum (see rmStart->Creation Code)
/// @param {real} Amount To (attemp to) Add to Cargo Type in objCargoHold
/// @return Returns the number of cargo holds free after addition is made.
/////////////////////////////////////////////////////////////////////////////////////////////////
// ADDITIONAL INFO FOR USE:
// Checks to see if the object is inside the view of the camera number supplied.
/////////////////////////////////////////////////////////////////////////////////////////////////
// author: michael scott stuart (mikeypro83)
// email: michaelscottstuart@yahoo.com
/////////////////////////////////////////////////////////////////////////////////////////////////

{
	if(argument_count<3) show_error("add_to_cargohold: argument_count < 3",true);
	_ch = instance_exists(argument[0]) ? argument[0] : noone;
	if(_ch==noone) show_error("add_to_cargohold: argument[0]==noone",true);
	_ct = argument[1];
	_cn = argument[2];
	if(_ct==cargo_type.CargoCount) show_error("add_to_cargohold: argument[1]==cargo_type.CargoCount", true);	
	update_cargohold(_ch); // update cargohold numbers				
	if(_cn > _ch.CargoFree)
	{
		_leftover = _cn - _ch.CargoFree;
		_ch.Cargo[_ct] += _ch.CargoFree;
		return _leftover;
	}	
	_ch.Cargo[_ct] += _cn;
	update_cargohold(_ch);
	return 0;
}