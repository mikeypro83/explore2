/////////////////////////////////////////////////////////////////////////////////////////////////
/// @function MouseUpdate(void)
/// @description Update global mouse input & status
/////////////////////////////////////////////////////////////////////////////////////////////////
// ADDITIONAL INFO FOR USE: Call from any View's room object Step event.
/////////////////////////////////////////////////////////////////////////////////////////////////
// author: michael scott stuart (mikeypro83)
// email: michaelscottstuart@yahoo.com
// license: modified freeware, open-source: Original attribution of work is required for all
//			distributions of derived and original versions of this work. Failure to provide a
//			visible and apparent notice of original attribution defaults any derived work to a 
//			commercial license and therefore applicable fees will apply for licensing said work. 
//			(see commercial.txt)
/////////////////////////////////////////////////////////////////////////////////////////////////

global.LMBIsHeld = global.LMBIsDown;
global.MMBIsHeld = global.MMBIsDown;
global.RMBIsHeld = global.RMBIsDown;
global.LMBWasReleased = global.LMBIsReleased;
global.MMBWasReleased = global.MMBIsReleased;
global.RMBWasReleased = global.RMBIsReleased;
global.LMBIsDown = mouse_check_button(mb_left);
global.MMBIsDown = mouse_check_button(mb_middle);
global.RMBIsDown = mouse_check_button(mb_right);
global.LMBIsReleased = mouse_check_button_released(mb_left);
global.MMBIsReleased = mouse_check_button_released(mb_middle);
global.RMBIsReleased = mouse_check_button_released(mb_right);
global.LMBIsHeld = global.LMBIsHeld && global.LMBIsDown && (global.LMBWasReleased==false);
global.MMBIsHeld = global.MMBIsHeld && global.MMBIsDown && (global.MMBWasReleased==false);
global.RMBIsHeld = global.RMBIsHeld && global.RMBIsDown && (global.RMBWasReleased==false);

/////////////////////////////////////////////////////////////////////////////////////////////////
