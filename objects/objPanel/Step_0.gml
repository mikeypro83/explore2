/// @description Insert description here
// 3/14/2020:
//  -- Panel Depth Sorting & Mouse Over is Tested and Working 100%!!
// 

{			
	_camx = get_activecam_viewx();
	_camy = get_activecam_viewy();
	
	_mx = mouse_x;
	_my = mouse_y;
	
	// Set YSize to Size if it is 0 or less because that signifies that it is not 
	// being used to specifiy size for this particular instance.
	YSize = ( YSize > 0 ) ? YSize : Size;
	
	// If the view surface & window has been resized then
	//
	if (global.WindowResized && RelocateOnResize)
	{
		self.x = self.x + (self.x/get_activecam_vieww());
		self.y = self.y + (self.y/get_activecam_viewh());
		show_debug_message("Worked");
		
	}	
	
	// The mouse moves faster than we update the panel's position, so we have to
	// assume that while this instance has MouseOver and the LMB is being held doing
	// the user is dragging the panel even if the mouse_x and mouse_y are in a "future" position.
	MouseOver = (MouseOver && global.LMBIsHeld) || point_in_rectangle(_mx,_my, x+_camx, y+_camy, _camx+x+Size, _camy+y+YSize);
	
	// if the Panel can have it's visibility toggled on and off
	// then when it is off force MouseOver to always be false,
	// the mouse is not allowed to drag or click on a panel that
	// is not visible.
	//
	if (visible==false)
		MouseOver = false;
	
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
				  
			} // Otherwise, oFirstPanel is SELF and the user is dragging this panel....
			else if ( Draggable )
			{
				self.x = mouse_x - _camx - (Size/2);
				self.y = mouse_y - _camy - (YSize/2);
			}			
			
		} // if ( global.LMBIsDown )		
				
	} // if ( MouseOver )	
	
}
