/// @description Insert description here
// You can write your code in this editor
event_inherited();

m1 = matrix_build(self.x+camera_get_view_x(view_camera[0]), self.y+camera_get_view_y(view_camera[0]), 0, 0, 0, 0, 1, 1, 1);
mid = matrix_build_identity();
matrix_set(matrix_world,m1);

// Default visual property values
_dxx = 1;
_dyy = 1;
_dsize = Size;
_hdsize = _dsize / 2;
_hdsize = _dsize / 2;
_dcol = image_blend;

draw_save_state();
draw_set_alpha(image_alpha);


if(oCargoHold!=noone && instance_exists(oCargoHold))
{
	cdrawstr(2,2,"`[`6[ `FC`7ARGO `FH`7OLD `6]`]          (`7"+ string(oCargoHold.CargoUsed) + "`8/`F"+ string(oCargoHold.MaxCargo)+"`6)");
	cdrawstrs(8,get_fonth()+2,global.cargo_type_str);
	
	for(i = 0; i < cargo_type.CargoCount; ++i)
	{	
		draw_text(128,get_fonth()+2 + i*(get_fonth()), 
			string(oCargoHold.Cargo[i]));
	}
}
else
{
	draw_text(2,2,"[ CARGO HOLD N/A ]");
	draw_text(64,64,"( NO CARGO HOLD )");
}
					
draw_restore_state();
matrix_set(matrix_world,mid);