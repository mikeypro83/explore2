/// @description Insert description here
// You can write your code in this editor

bit_count = irandom_range(4,8);
for(i = 0; i < bit_count; ++i)
{
	bit = instance_create_layer(self.x,self.y,"Instances",objAsteroidPowBit);		
}

instance_destroy(self);