// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function PlayerState_Dead(){
	hsp = 0;
	vsp = 0;
	//If just arriving in this state
	if(sprite_index != sEnemyDie and sprite_index != sPlayerHit){
		sprite_index = sEnemyDie;
		image_index = 0;
		image_speed = 1;
	}
	if(animation_end()){
		audio_stop_sound(mLevel01);
		global.targetX = -1;
		global.targetY = -1;
		RoomTransition(TRANS_TYPE.SLIDE, rLevel1);
	}

}