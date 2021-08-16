/// @description Insert description here
// You can write your code in this editor
randomize();



global.gameSaveSlot = 0;


global.gamePaused = false;
global.textSpeed = 0.5;
global.targetRoom = -1;
global.targetX = -1;
global.targetY = -1;
global.targetDirection = 0;
global.iCamera = instance_create_layer(0,0, layer, oCamera);
global.playerMaxHP = 10;
global.playerHP = global.playerMaxHP
global.iLifted = noone;

//Unlockables
global.hasSword = 1;
global.hasDash = 0;
global.hasWallGrab = 0;
global.hasDoubleJump = 0;


global.lightIntensity = 1;
global.lightRange = 1;


surface_resize(application_surface, RESOLUTION_W, RESOLUTION_H);
room_goto(ROOM_START);