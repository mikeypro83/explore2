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

///////////////////////////////

global.IsFullscreen = false;
global.ShowDebugInfo = false;		// TODO: Switch to a few different types, one shows everything, one shows collisions only
global.ShowHelpScreen = true;
global.ShowCargoPanel = false;

global.pid = 0;		// planet id numbers. temporary for saving surfaces.

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

global.draw_text_row_h = 9;
global.draw_text_row_auto = true;		// let draw_text_row auto-calculate string height

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

global.cargo_type_str = ["Silica","Iron","Copper","Silver","Gold","Nickel","Uranium","Plutonium","Magnesium","Platinum","FrozenH20","CargoCount"];

enum align_type {
	Evil,
	Nuetral,
	Good,
	AlignCount
}

global.align_type_str = ["Evil","Nuetral","Good", "AlignCount"];

enum obj_type {
	None,
	Player,
	Asteroid,
	Ship,
	SpaceStation,
	ObjCount
}

global.obj_type_str = ["None","Player","Asteroid","Ship","Space Station", "ObjCount"];

///////////////////////////////
// GLOBAL OBJECTS 
///////////////////////////////

global.oMinimap = instance_create_layer(0,0,"Instances", objMinimap);
global.oPlayer = instance_create_layer(0,0,"Instances", objPlayer);
global.oStars = instance_create_layer(0,0,"Instances", objStars);
global.oTargetInfoPanel = instance_create_layer(0,0,"Instances", objTargetInfoPanel);
global.oSystemInfoPanel = instance_create_layer(0,0,"Instances", objSystemInfoPanel);
global.oHelpScreen = instance_create_layer(0,0,"Instances", objHelpScreen);
global.oCargoHoldPanel = instance_create_layer(0,0,"Instances",objCargoHoldPanel);


global.iTabSelectedAsteroid = 0; // This is used for tabbing through Asteroids..

///////////////////////////////
// Testing
///////////////////////////////

generate_asteroids();



