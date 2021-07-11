// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function EnemyState_Chase(){
	if(abs(oPlayer.x-x) <= 5){
		dir = 0;
	}
	else{
		dir = sign(oPlayer.x - x);
	}
	
	hsp = dir * walksp;
	if(dir!=0){
		sprite_index = sEnemyWalk;
		image_xscale = dir;
		image_speed = 1;
	}
	else{
		sprite_index = sEnemyIdle;
	}
	if(distance_to_object(oPlayer) < 50) {
		state = ENEMYSTATE.ATTACK;
	}
	if(distance_to_object(oPlayer) > 160){
		state = ENEMYSTATE.IDLE;
	}
	Gravity();
	CollisionDetection();
	if(touchingRWall or touchingLWall){
		if(!instance_place(x,y-30,oWall)){
			vsp = -10
			state = ENEMYSTATE.IN_AIR;
		}
	}
	x += hsp;
	y += vsp;
}