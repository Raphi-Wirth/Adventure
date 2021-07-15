// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function EnemyState_Chase(){
	if(abs(oPlayer.x-x) <= 10){
		dir = 0;
	}
	else{
		dir = sign(oPlayer.x - x);
	}
	
	hsp += dir*walksp;
	if(abs(hsp)>maxWalkSpeed){
		hsp = maxWalkSpeed*sign(hsp);
	}
	if(dir!=0){
		sprite_index = sEnemyWalk;
		image_xscale = dir;
		image_speed = 1;
	}
	else{
		sprite_index = sEnemyIdle;
	}
	Gravity();
	CollisionDetection();
	if(abs(oPlayer.x - x) < 70 and abs(oPlayer.y-y)<30){
		state = ENEMYSTATE.ATTACK;
	}
	if(sqrt(sqr(oPlayer.x - aggrodAtX) + sqr(oPlayer.y - aggrodAtY)) > 800){
		state = ENEMYSTATE.IDLE;
	}
	if((touchingRWall and touchingRWall.object_index == oWall)
	or (touchingLWall and touchingLWall.object_index == oWall)){
		if(!instance_place(x,y-30,oWall)){
			vsp = -10
			state = ENEMYSTATE.IN_AIR;
		}
	}
	x += hsp;
	y += vsp;
}