/// @description Insert description here
// You can write your code in this editor
randomize();

global.gamePaused = false;
global.textSpeed = 0.5;
global.targetRoom = -1;
global.targetX = -1;
global.targetY = -1;
global.targetDirection = 0;
global.iCamera = instance_create_layer(0,0, layer, oCamera);
global.playerMaxHP = 5;
global.playerHP = global.playerMaxHP
global.iLifted = noone;


surface_resize(application_surface, RESOLUTION_W, RESOLUTION_H);
room_goto(ROOM_START);