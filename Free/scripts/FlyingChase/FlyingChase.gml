// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function FlyingChase(){
	sprite_index = sprMove;
	
	if(instance_exists(target)){
		xTo = target.x;
		yTo = target.y - target.sprite_height/2;
		var _distanceToGo = point_distance(x,y,xTo,yTo);
		image_speed = 0;
		dir = point_direction(x,y,xTo,yTo);
		if(_distanceToGo > enemySpeed){
			hsp = lengthdir_x(enemySpeed, dir);
			vsp = lengthdir_y(enemySpeed , dir);
		}
		else{
			hsp = lengthdir_x(enemySpeed, dir);
			vsp = lengthdir_y(enemySpeed, dir);
		}
		if(hsp != 0){
			image_xscale = sign(hsp);
		}
		//Collide and move
		EnemyTileCollision();
	}
	if(instance_exists(target) and point_distance(x,y,target.x,target.y) <= enemyAttackRadius){
		state = ENEMYSTATE.ATTACK;
		sprite_index = sprAttack;
		image_index = 0;
		image_speed = 1;
	}
	if(instance_exists(target) and point_distance(x,y,target.x,target.y) <= enemyDeAggroRadius){
		stateTarget = ENEMYSTATE.WANDER;
		stateWaitDuration = 15;
		state = ENEMYSTATE.WAIT;
	}
}

