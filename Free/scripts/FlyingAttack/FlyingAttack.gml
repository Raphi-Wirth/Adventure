// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function FlyingAttack(){
	var _spd = enemySpeed;
	
	var _distanceToGo = point_distance(x,y,xTo,yTo);
	
	if(_distanceToGo > _spd){
		dir = point_direction(x,y,xTo,yTo);
		hsp = lengthdir_x(_spd,dir);
		vsp = lengthdir_y(_spd, dir);
		if (hsp != 0){
			image_xscale = sign(hsp);
		}
		
		if(EnemyTileCollision() == true){
			xTo = x;
			yTo = y;
		}
	}
	else{
		x = xTo;
		y = yTo;
		stateTarget = ENEMYSTATE.CHASE;
		stateWaitDuration = 15;
		state = ENEMYSTATE.WAIT;
	}
}