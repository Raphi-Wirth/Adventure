/// @description Insert description here
// You can write your code in this editor
randomize();

global.gamePaused = false;
global.textSpeed = 0.5;

surface_resize(application_surface, RESOLUTION_W, RESOLUTION_H);
room_goto(ROOM_START);