/// @description A Linked-List Based GUI Panel Object. (Like a Window/Surface/View but less features)
/// Any GUI-like elements wishing to work with other GUI-like elements will derive from this object.
{
	Name = "None";
	Size = 0;	
	YSize = 0;	// 0 or negative YSize value signifies that the Y component is the same as Size, which
				// is the X component's value.
	
	Draggable = true;	// LMB drag will drag the panel with it.
	TitleBGColor = make_color_rgb(64,64,64);
	TitleBGHiColor = make_color_rgb(76,76,96);
	BGColor = make_color_rgb(32,32,32);
	Color1 = make_color_rgb(64,64,64);
	Color2 = make_color_rgb(128,128,128);
	Color3 = make_color_rgb(96,96,96);
	Color4 = make_color_rgb(64,64,128);
	Font = smFont1;
	MouseOver = false;	
	DebugY = global.debugpanels_y;
	global.debugpanels_y -= get_fonth();	
	depth = global.GUIDepth;
	RelocateOnResize = false;	
	
	//
	// PANEL SORTING METHOD CODE
	//
	// Linked-List Style Sorting
	// I determined that a linked-list style, self-sorting implementation for objPanel's
	// will alleviate the depth-sorting issues I have run into for objPanels.
	//
	// Define oNext and oPrev which are default noone but will be assigned soon.	
	oNext = noone;
	oPrev = noone;
	
	// Linked-List Style.	
	// Insert and Assign this new panel to the Front of the linked-list,
	// move the previous Front panel to the second spot in the list.
	if (global.oFirstPanel==noone) 
	{
		global.oFirstPanel = self;		
	}
	else
	{
		global.oFirstPanel.oPrev = self;
		self.oNext = global.oFirstPanel;
		global.oFirstPanel = self;
	}
	// Assign the Front Panel always to depth = GUIDepth - 1 since it is the Front Panel.
	global.oFirstPanel.depth = global.GUIDepth-1;
		
	// objother is the first objPanel we are checking
	objother = global.oFirstPanel.oNext	;
	// Depth-Sort The Panels
	while(objother!=noone)
	{	
		if(objother.oPrev != noone)
			objother.depth = objother.oPrev.depth + 1;
		else
			objother.depth = global.GUIDepth-1;	// this was already done earlier, if the logic is correct
												// but I do it anyway for clarity.. I guess..
		objother = objother.oNext;
	}
}