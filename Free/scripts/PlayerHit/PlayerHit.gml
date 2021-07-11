// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function PlayerHit(){
	var _damage = argument0;
	hp -= _damage;
	if(invulnerable != 1){
		if(hp>0){
			flashAlpha = 1;
			state = PLAYERSTATE.HIT;
			hitNow = true;
		}
		else{
			state = PLAYERSTATE.DEAD;
		}
	}
}
