// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function RockoHit(){
	flash = 0.85;
	audio_play_sound(mRockWallHit, 1000, false);
	DropItems(x,y,[oFragRock, oFragRock, oFragRock, oFragRock, oFragRock, oFragRock, oFragRock, oFragRock], 3,sign(x-oPlayer.x));
}