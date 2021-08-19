/// @description Insert description here
// You can write your code in this editor
if(room == rOutside){
	audio_sound_gain(_music, max(0.75 - oPlayer.x/room_width/1.5,0), 50);
}
