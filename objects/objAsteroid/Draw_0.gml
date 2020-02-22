/// @description Primitive Draw
// You can write your code in this editor
draw_self();

if(global.oPlayer.oTarget==self)
{
	draw_set_color(c_white);
	draw_roundrect(self.x-primitive_size, self.y-primitive_size,self.x+primitive_size,self.y+primitive_size,true);
}