// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function PlayerState_Hit(){
	if(sprite_index != sPlayerHit){
		ScreenShake(10,10);
		count = 0;
		invulnerable = 1;
		flash = 0.75
		sprite_index = sPlayerHit;
	}
	if(count < 15){
		count+=1;
	}
	else if(count == 15){
		state = PLAYERSTATE.FREE;
	}
	Gravity();
	PlayerCollision();

}