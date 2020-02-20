/// @description Insert description here
// You can write your code in this editor
{
	
	// for GUI-like elements, we offset our position by the camera's view position in order
	// to use display pixel vectors.
	m1 = matrix_build(self.x+camera_get_view_x(view_camera[0]), self.y+camera_get_view_y(view_camera[0]), 0, 0, 0, 0, 1, 1, 1);
	// get an identity matrix for later.
	mid = matrix_build_identity();
	// set our world matrix so everything is draw at this position.
	matrix_set(matrix_world,m1);

	// Default visual property values
	_x = 0;
	_y = 0;		
	_dcol = image_blend;
	_dal = image_alpha;
	_olcol = draw_get_color();
	_olal = draw_get_alpha();
	
	// MAIN PANEL RECTANGLE
	draw_set_color(BGColor);
	draw_rectangle(_x,_y,_x+Size,_y+Size,false);

	// HEADING RECTANGLE
	draw_set_color(TitleBGColor);
	draw_rectangle(_dxx+2,_dyy+1,_dxx+Size-2,get_fonth(),false);

	// OUTLINE RECTANGLE
	draw_rectangle_color(_x,_y,_x+Size,_y+Size,Color1,Color2,Color3,Color4,true);
	draw_set_font(Font);

	draw_set_color(_olcol);
	draw_set_alpha(_olal);
	matrix_set(matrix_world,mid);
}