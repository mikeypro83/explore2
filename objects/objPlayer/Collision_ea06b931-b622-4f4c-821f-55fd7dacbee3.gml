/// @description Insert description here
// You can write your code in this editor
{
	if(oCargoHold!=noone)
	{
		if (oCargoHold.CargoFree > 0)
		{
			_remain123 = add_to_cargohold(oCargoHold, other.CargoType, other.Quantity);					
			create_floatup_text(self.x,self.y-8,string(other.Quantity-_remain123),"Instances");
			if(_remain123>0)
			{
				other.Quantity = _remain123;
				other.image_alpha -= 0.75;
				create_floatup_text(self.x,self.y-8,"CARGO FULL","Instances");				
			}
			else
			{
				instance_destroy(other);
			}
		}
	}	
}