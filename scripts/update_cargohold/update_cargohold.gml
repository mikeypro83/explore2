/////////////////////////////////////////////////////////////////////////////////////////////////
/// @description update_cargohold
/// @param {real} ObjectID of objCargoHold
/////////////////////////////////////////////////////////////////////////////////////////////////
// ADDITIONAL INFO FOR USE:
//
/////////////////////////////////////////////////////////////////////////////////////////////////
// author: michael scott stuart (mikeypro83)
// email: michaelscottstuart@yahoo.com
/////////////////////////////////////////////////////////////////////////////////////////////////
{
	_ch = instance_exists(argument[0]) ? argument[0] : noone;
	if(_ch==noone) show_error("add_to_cargohold: argument[0]==noone",true);	
	_ch.CargoUsed = 0;	
	for(i = 0; i < cargo_type.CargoCount; ++i)
	{
		_ch.CargoUsed += _ch.Cargo[i];	// Add number of cargo_type.(i)		
	}
	_ch.CargoFree = _ch.MaxCargo - _ch.CargoUsed;
	return true;
}