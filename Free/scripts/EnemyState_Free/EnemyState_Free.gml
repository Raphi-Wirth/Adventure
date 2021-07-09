// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function EnemyState_Free(){
	//This state uses gravity
	
	sprite_index = sEnemyWalk
	if(touchingLWall){
		image_xscale = 1;
		hsp = walksp;
	}
	else if(touchingRWall){
		image_xscale = -1;
		hsp = -walksp;
	}
	Gravity();
	CollisionDetection();
	x+=hsp;
	y+=vsp;
}