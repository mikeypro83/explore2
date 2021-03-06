Panel = instance_create_layer(0,0,"Instances", objMinimapPanel);
global.oPlayer = instance_create_layer((room_width/2)-2048,(room_height/2)-2048,"Instances", objPlayer);
global.oStars = instance_create_layer(0,0,"Instances", objStars);
global.oTargetInfoPanel = instance_create_layer(0,0,"Instances", objTargetInfoPanel);
global.oSystemInfoPanel = instance_create_layer(0,0,"Instances", objSystemInfoPanel);
global.oHelpScreen = instance_create_layer(0,0,"Instances", objHelpScreen);
global.oCargoHoldPanel = instance_create_layer(0,0,"Instances",objCargoHoldPanel);
global.oPlanet = instance_create_layer(room_width/2,room_height/2,"Instances",objPlanet);

/*
	This isn't how you would normally do it, normally you would create an object derived
	from the objTextButton that sets it's text and position in create (possibly updating it in step)
	then create THAT object.
*/
global.oQuitButton = instance_create_layer(786,612,"Instances",objTextButton);
global.oQuitButton.Text = "`CQUIT";
global.oQuitButton.HiText = "`EQUIT";
global.oQuitButton.x = window_get_width() - 256;
global.oQuitButton.y = 1;

///////////////////////////////
// Testing
///////////////////////////////

generate_asteroids();