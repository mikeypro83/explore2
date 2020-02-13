/// @description Insert description here
// You can write your code in this editor

if(global.iTabSelectedAsteroid==self.Number || global.oPlayer.oTarget==self)
{
	select_next_asteroid();
	global.oPlayer.oTarget = noone;
}