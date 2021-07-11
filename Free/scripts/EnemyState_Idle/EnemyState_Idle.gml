// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function EnemyState_Idle(){
	//This state uses gravity
	hsp = 0;
	sprite_index = sEnemyIdle;
	Gravity();
	CollisionDetection();
	
	if(distance_to_object(oPlayer) < 130){
		state = ENEMYSTATE.CHASE;
	}
	x+=hsp;
	y+=vsp;
}