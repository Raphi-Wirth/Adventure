// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function RockFilledAttack(){
	if(sprite_index != sprAttack){
		sprite_index = sprAttack;
		image_index = 0;
		image_speed = 1;
		ds_list_clear(hitByAttack);
	}
	EnemyCalcAttack(sRockFilledSmashHB);
	if(animation_end()){
		state = ENEMYSTATE.CHASE;
	}
}