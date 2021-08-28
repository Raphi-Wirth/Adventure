// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function BreakableWallBehaviour(){
	hp--;
	rumble = 15;
	DropItems(x, y, array_create(10, oFragRock), 5, sign(x-oPlayer.x));
	audio_play_sound(mRockWallHit, 1000, false);
	if(hp == 0){
		instance_destroy();
	}
}