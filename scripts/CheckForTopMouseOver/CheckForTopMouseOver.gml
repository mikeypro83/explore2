/////////////////////////////////////////////////////////////////////////////////////////////////
/// @function CheckForTopMouseOver()
/// @description Let's an object that uses the MouseOver variable determine wether or not
///	it is the top-most object and assigns global.oMouseOverObj accordingly, if neccessary.
/////////////////////////////////////////////////////////////////////////////////////////////////
// ADDITIONAL INFO FOR USE:
/////////////////////////////////////////////////////////////////////////////////////////////////
// author: michael scott stuart (mikeypro83)
// email: michaelscottstuart@yahoo.com
// license: modified freeware, open-source: Original attribution of work is required for all
//			distributions of derived and original versions of this work. Failure to provide a
//			visible and apparent notice of original attribution defaults any derived work to a 
//			commercial license and therefore applicable fees will apply for licensing said work. 
//			(see commercial.txt)
/////////////////////////////////////////////////////////////////////////////////////////////////
{
	if(self==noone||self==undefined) 
		return;

	if(global.oMouseOverObj==noone&&self.MouseOver)
	{
		global.oMouseOverObj=self;
		return;
	}
	if (self.MouseOver&&global.oMouseOverObj!=self)
	{
		if(global.oMouseOverObj.depth > self.depth)
		{
			global.oMouseOverObj.MouseOver=false;
			global.oMouseOverObj = self;
		} else
		{
			self.MouseOver = false;
		}
	}
	
	if(global.oMouseOverObj!=noone)
		if(global.oMouseOverObj.MouseOver==false)
			global.oMouseOverObj=noone;

}