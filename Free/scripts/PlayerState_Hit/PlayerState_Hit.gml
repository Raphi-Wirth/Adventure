// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function PlayerState_Hit(){
	if(sprite_index != sPlayerHit){
		sprite_index = sPlayerHit;
	}
	if(flashAlpha > 0){
		flashAlpha -= 0.05;
	}
	else if(flashAlpha == 0){
		flashAlpha = 1;
		invulnerable = 1;
		state = PLAYERSTATE.FREE;
	}
	Gravity();
	CollisionDetection();
	x+=hsp;
	y+=vsp;
}