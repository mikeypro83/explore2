global.oMinimap = instance_create_layer(0,0,"Instances", objMinimap);
global.oPlayer = instance_create_layer(0,0,"Instances", objPlayer);
global.oStars = instance_create_layer(0,0,"Instances", objStars);
global.oTargetInfoPanel = instance_create_layer(0,0,"Instances", objTargetInfoPanel);
global.oSystemInfoPanel = instance_create_layer(0,0,"Instances", objSystemInfoPanel);
global.oHelpScreen = instance_create_layer(0,0,"Instances", objHelpScreen);
global.oCargoHoldPanel = instance_create_layer(0,0,"Instances",objCargoHoldPanel);


//global.oTestPanel = instance_create_layer(512,612,"Instances",objPanel);
//global.oTestPanel.Size = 128;

global.oQuitButton = instance_create_layer(786,612,"Instances",objTextButton);
global.oQuitButton.Text = "`CQUIT";
global.oQuitButton.x = window_get_width() - 256;
global.oQuitButton.y = 1;

///////////////////////////////
// Testing
///////////////////////////////

generate_asteroids();