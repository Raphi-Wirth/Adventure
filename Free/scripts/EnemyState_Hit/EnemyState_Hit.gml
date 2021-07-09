// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function EnemyState_Hit(){
	if(flashAlpha > 0){
		flashAlpha -= 0.05;
	}
	else if(flashAlpha == 0){
		state = ENEMYSTATE.FREE;
	}
	if(touchingLWall){
		image_xscale = 1;
		hsp = walksp;
	}
	else if(touchingRWall){
		image_xscale = -1;
		hsp = -walksp;
	}
	CollisionDetection();
	x+=hsp;
	y+=vsp;
}