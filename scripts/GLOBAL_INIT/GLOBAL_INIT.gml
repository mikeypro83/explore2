/////////////////////////////////////////////////////////////////////////////////////////////////
/// @function GLOBAL_INIT()
/// @description GLOBAL_INIT - Globals & Startup Stuff
/////////////////////////////////////////////////////////////////////////////////////////////////
// author: michael scott stuart (mikeypro83)
// email: michaelscottstuart@yahoo.com
// license: modified freeware, open-source: Original attribution of work is required for all
//			distributions of derived and original versions of this work. Failure to provide a
//			visible and apparent notice of original attribution defaults any derived work to a 
//			commercial license and therefore applicable fees will apply for licensing said work. 
//			(see commercial.txt)
/////////////////////////////////////////////////////////////////////////////////////////////////
/*
	DESIGN OUTLINE-CEMENT:
	
			-- NO SCROLLING TEXT/ITEM BOXES. DO WITHOUT. NOT WORTH THE TIME AT THIS POINT.
			-- Object Images are generated in Create Events then converted to sprites!!
			   that way we stick to the procedurally generated design, BUT also get the flexibility
			   of sprites. And we get a (major) performance boost for using sprites.
			   -- NOTE: UNFORTUNATELY -- Some things cannot be done procedurally at all and
			   then we are forced to use sprites. That is fine.. :)
			   
			-- Scripts that create objects start with spawn_    
			
			-- GENERAL IDEA NEEDS FLESHED-OUT: have planet generate basic sprite then use shader to move texture and other things
				adam and I discussed extra shaders for weather effects / and ground effects for 
				celestial bodies (objPlanet)
								
			--- > PlanetView Room		-- Shows a planet with or without asteroids; shows Ships, Help Screen For the Room
											show ships within solar system and what alignment they are dependent on the IFF detector installed.
			--- > SolarSystemView Room  -- Shows scaled down view of all planets, the star and the asteroid belts that may or may not 
											be around planets; show ships within range and if IFF detector is installed then what alignment they are.
											jump info (if jumping to a planet), etc, Help Screen for the Room
			--- > NavMapView Room		-- Shows scaled down view of all solar systems to jump to, jump info if jumping to a solar system,
										-- Access to view cargo, Help Screen for the Room
				
			objIFFDectector:				
				objScannerLow				-- scans objects in PlanetView and shows their position in minimap.
				objScannerPrecise			-- scans objects in PlanetView, and SolarSystemView.
				objIFFDectectorLow			-- scans objects in PlanetView with alignment and positions in minimap, 
												shows objects in the SolarSystemView and shows their current planet location.										
				objIFFDectectorPrecise		-- scans objects in PlanetView, SolarSystem view and shows their alignments and positions in both views.
			objNavMapScanner				-- Shows objects (all solar systems and their detected ship counts in each) 
			objNavMapIFFDetector			-- shows objects and their alignments in all solar systems along, organized by their alignment type:
													ie: [       IFF Detector       ]
														 Hostile : 2					// hostile ships that may or may not attack, of course ..
																						// fighters most likely to fight and flee when severely damaged
																						// merchants most likely to run but will flee with defensive fire																						
														 Friend  : 1					// friendly ships, may help out in fight or may run away
																						// fighters: same as hostile fighters but for friendlies.
																						// merchants: same as hostile merchants but for friendlies.
														 Nuetral : 6					// merchant ships, always run in a fight unless provoked by player or
																						// a hostile/allied merchant, always flees to any fighter.
														 Other   : 0					// ore & asteroids
				
			
	TODO:
				
			-- ALL GUI ELEMENTS NEED TO RE-CALCULATE THEIR POSITIONS BASED ON SCREEN SIZE WHEN FULLSCREEN/WINDOW IS TOGGLED!
			
			-- create GUI auto-position option (toggles) or user-set (click on title and drag)
			   -- make it so you can save the GUI positions if user-set
			
			-- rework select next asteroid feature to select next object in view (doesn't matter if its a
				asteroid or not)

			-- finish reorganizing/renaming the scripts and objects
				-- rename scripts then move to 'new' script folder
				-- clean up each script's code
					-- distance_between_points	(rename? clean up code...)
					-- generate_asteroids		(rename? clean up..)
					-- is_outside_view			(rename? clean up..)
					-- add_to_cargohold			(rename? clean up..)
					-- update_cargohold			(rename? clean up..)
					-- cargo_type_tostr			(rename? clean up..)
					-- set_shader_blacken		(rename? clean up..)
					-- create_float_text		(rename? clean up..)
					-- select_next_asteroid		(this is getting revamped to select_next_object i believe)					

*/

///////////////////////////////
// CONTROL KEY BINDS
///////////////////////////////

global.keyToggleFullscreen = vk_f11;
global.keyToggleDebugInfo = vk_f10;
global.mouseSelectObjectButton = mb_left;
global.keyUse = vk_space;
global.keyTurnLeft = ord("A");
global.keyTurnRight = ord("D");
global.keyAccelerate = ord("W");
global.keyDeccelerate = ord("S");
global.keySelectSystem1 = ord("1");
global.keySelectSystem2 = ord("2");
global.keySelectSystem3 = ord("3");
global.keySelectSystem4 = ord("4");
global.keyNextSystem = vk_right;
global.keyPreviousSystem = vk_left;
global.keySelectNextObject = vk_tab;
global.keyScrollUp = vk_up;
global.keyScrollDown = vk_down;
global.keyToggleHelpScreen = vk_f1;
global.keyToggleCargoPanel = ord("C");

////////////////////////////////////////////
/// MOUSE CONTROLS -- see script MouseInput
////////////////////////////////////////////

global.LMBIsDown = false;
global.LMBIsHeld = false;
global.LMBWasReleased = false;
global.MMBIsDown = false;
global.MMBIsHeld = false;
global.MMBWasReleased = false;
global.RMBIsDown = false;
global.RMBIsHeld = false;
global.RMBWasReleased = false;
global.LMBIsReleased = false;
global.MMBIsReleased = false;
global.RMBIsReleased = false;

///////////////////////////////
/// GUI OPTIONS
///////////////////////////////

global.IsFullscreen = false;
global.ShowDebugInfo = false;		// TODO: Switch to a few different types, one shows everything, one shows collisions only
global.ShowHelpScreen = true;		//     
global.ShowCargoPanel = false;		//  Are these neccessary since they are now objPanel's and have visible attribute????

global.GUIDepth = -20;

///////////////////////////////
// GUI ELEMENT POSITIONS
///////////////////////////////

global.minimap_x = window_get_width() - 64-1;
global.minimap_y = 0;
global.targetinfo_x = 128+40;
global.targetinfo_y = 0;
global.systeminfo_x = 0;
global.systeminfo_y = 0;
global.helpscreen_x = 16;
global.helpscreen_y = 16;
global.cargohold_x = 8;
global.cargohold_y = 256;

///////////////////////////////
// MY TRICK KNEE
///////////////////////////////

global.cdrawstrs_height = 0;				// for auto-text-height calculations. You can set this to a fixed number or 0 for auto-calc.
global.cdrawstr_incd_y = false;				// for `n newline code to work properly we have to track the y coordinate when it is used. don't change the value.


global.debugpanels_y = 256;

global.oFirstPanel = noone;					// First Panel in the Linked-List Style of depth-sorting I'm using for objPanel's.

global.WindowResized = false;
global.PrevViewW = 0;
global.PrevViewH = 0;

///////////////////////////////
// TEXT THINGS HERE
///////////////////////////////

enum game_txt {
	
	//cargo panel & cargo stuff text
	CargoHeader,
	CargoFull,
	//minimap text
	//target panel text
	TargetHeader,
	TargetType,
	TargetDamage,
	TargetIDNum,
	SystemInfoWeapons,
	SystemInfoMining,
	SystemInfoComms,
	SystemInfoTargetting
	
	
	//systemiunfo text
	
}

///////////////////////////////
// RANDOMIZE ALL THE THINGS
///////////////////////////////
randomize();

///////////////////////////////
// GAME DATA THINGS
///////////////////////////////

						// percentage found on a typical class M planet's crust. (the numbers are made up; completely fictional)
enum cargo_type {
	Silica,				// 80%
	Iron,				// 60%
	Copper,				// 50%
	Silver,				// 30%
	Gold,				// 20%
	Nickel,				// 30%
	Uranium,			// 10%
	Plutonium,			// 15%
	Magnesium,			// 20%
	Platinum,			// 5%
	FrozenH20,			// 60%, but found in non-frozen form (frozen for transport)
	CargoCount
}

global.cargo_type_str = ["Silica","Iron","Copper","Silver","Gold","Nickel","Uranium","Plutonium","Magnesium","Platinum","FrozenH20",""];

enum align_type {
	Evil,
	Nuetral,
	Good,
	AlignCount
}

global.align_type_str = ["Evil","Nuetral","Good", ""];

enum obj_type {
	None,
	Player,
	Asteroid,
	Ship,
	SpaceStation,
	ObjCount
}

global.obj_type_str = ["None","Player","Asteroid","Ship","Space Station", ""];

///////////////////////////////
// GLOBAL OBJECTS 
///////////////////////////////

global.TextButtonFont1 = smFont1;

global.iTabSelectedAsteroid = 0; // TODO: CHANGE -- This is used for tabbing through Asteroids..

///////////////////////////////
// SET SOME STUFF
///////////////////////////////

draw_set_font(smFont1);


///////////////////////////////
// HARDCODED GPU STUFF
///////////////////////////////

gpu_set_tex_filter(false);			// no filtering, we want the raw pixel look! _ALWAYS_

///////////////////////////////
// Set the first room
///////////////////////////////

view_camera[0] = camera_get_active();

room_goto_next();

