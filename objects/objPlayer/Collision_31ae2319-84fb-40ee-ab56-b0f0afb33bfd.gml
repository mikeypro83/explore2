/// @description Insert description here
// You can write your code in this editor
{	
	self.x -= (other.x - self.x) * 0.01;
	self.y -= (other.y - self.y) * 0.01;

	self.speed = 0; //-self.speed;
	//self.direction = -self.direction;
}