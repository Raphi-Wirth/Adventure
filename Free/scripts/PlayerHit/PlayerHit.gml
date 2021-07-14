// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function PlayerHit(){	
	if(invulnerable != 1){
		PlayerTakesDamage(argument0);
		if(currentHP>0){
			flashAlpha = 1;
			state = PLAYERSTATE.HIT;
			hitNow = true;
		}
		else{
			state = PLAYERSTATE.DEAD;
		}
	}
}
