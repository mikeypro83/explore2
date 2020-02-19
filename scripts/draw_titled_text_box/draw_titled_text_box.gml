// 
_x = argument[0];
_y = argument[1];
_size = argument[2];

// MAIN PANEL RECTANGLE
draw_set_color(_bgcol);
draw_rectangle(_dxx,_dyy,_dxx+panel_size,_dyy+panel_size,false);

// HEADING RECTANGLE
draw_set_color(make_color_rgb(64,64,64));
draw_rectangle(_dxx+1,_dyy+1,_dxx+panel_size-2,get_font_h(),false);

// OUTLINE RECTANGLE
draw_rectangle_color(_dxx,_dyy,_dxx+panel_size,_dyy+panel_size,_c1,_c2,_c3,_c4,true);
draw_set_font(smFont1);

draw_set_color(c_white);