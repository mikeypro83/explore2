/// @description Insert description here
// 3/14/2020:
//  -- Panel Depth Sorting & Mouse Over is Tested and Working 100%!!
// 

{	
	if(visible==false)
		return;
		
	_camx = get_activecam_viewx();
	_camy = get_activecam_viewy();
	
	_mx = mouse_x;
	_my = mouse_y;
	
	// The mouse may move faster than the Panel does, so if we are dragging we will
	// enforce the mouseover even tho the mouse may technically be somewhere else,
	// as long as the user is holding LMB down we don't want to let go of the panel...
	// Otherwise we do a normal mouse-over check.
	MouseOver = (MouseOver && global.LMBIsHeld) || point_in_rectangle(_mx,_my, x+_camx, y+_camy, _camx+x+Size, _camy+y+Size);
		
	if ( MouseOver )
	{
		if ( global.LMBIsDown )
		{
			// Traverse linked-list of panels to find one that may possibly have
			// mouseover and be in front of this panel
			//
			othermo = global.oFirstPanel;
			while (othermo != noone)
			{
				// if another panel has mouseover and is in front of this panel,
				// we need not go any further.
				//
				if (othermo.MouseOver && othermo.depth < self.depth)
					return;	
					
				// Otherwise keep traversing the list.
				othermo = othermo.oNext;
			}			
			
			// If we get this far that means one of two things:
			// Either oFirstPanel is noone, or oFirstPanel is self
			if ( global.oFirstPanel != self )
			{	
				if ( global.oFirstPanel != noone)
					global.oFirstPanel.MouseOver = false;
				else
				{
					global.oFirstPanel = self;
					global.oFirstPanel.depth = global.GUIDepth-1;
					return;
				}

				//
				// Move this panel to the front of the linked-list
				// and close the gap created by the move.
				// 
					
				// Close the Gap We Made Moving Self
				if(self.oNext!=noone)					// self.onext.oprev = self.oprev;
					self.oNext.oPrev = self.oPrev;		// 
				if(self.oPrev!=noone)					// self.oprev.onext = self.onext; 
					self.oPrev.oNext = self.oNext;		//
					
				// Assign Self to First of Linked-List
				// And Move Original First to Second in the List
				self.oNext = global.oFirstPanel;		
				global.oFirstPanel.oPrev = self;
				global.oFirstPanel = self;
					
				// Now depth-sort the panels!
				global.oFirstPanel.depth = global.GUIDepth-1;					
				oself = global.oFirstPanel.oNext;					
				while(oself!=noone)
				{
					if(oself.oPrev!=noone)
						oself.depth = (oself.oPrev != noone) ? oself.oPrev.depth + 1 : global.GUIDepth-1;
					oself = oself.oNext;
				}
				  
			} // Otherwise, oFirstPanel is SELF and the user is dragging this panel.
			else 
			{
				self.x = mouse_x - _camx - (Size/2);
				self.y = mouse_y - _camy - (Size/2);
			}			
			
		} // if ( global.LMBIsDown )		
				
	} // if ( MouseOver )

}
