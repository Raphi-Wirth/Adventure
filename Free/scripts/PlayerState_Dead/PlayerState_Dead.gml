// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function PlayerState_Dead(){
	image_xscale = 0;
	audio_stop_sound(mLevel01);
	room_restart();
}