// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function EnemyHit(){
	var _damage = argument0;
	currentHP -= _damage;
	
	if(currentHP>0){
		flashAlpha = 1;
		hitNow = true;
	}
	else{
		state = ENEMYSTATE.DEAD;
	}
}