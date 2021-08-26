// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function LeafletHit(){
	flash = 0.85;
	audio_play_sound(mBushRustleHighPitch, 1000, false);
	DropItems(x,y,[oFragPlant, oFragPlant, oFragPlant, oFragPlant, oFragPlant, oFragPlant, oFragPlant, oFragPlant], 3,sign(x-oPlayer.x));
}