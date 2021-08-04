// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function FlyingWander(){
	sprite_index = sprMove;
	
	//At destination or taken too long
	if((x==xTo) and (y == yTo)) or (timePassed > enemyWanderDistance/enemySpeed){
		hsp = 0;
		vsp = 0;
		//End move animation
		sprite_index = sprIdle;

	
	
		//Set new target destination
		if(++wait >= waitDuration){
			wait = 0;
			timePassed = 0;
			dir = point_direction(x,y,xstart,ystart) + irandom_range(-45,45);
			xTo = x + lengthdir_x(enemyWanderDistance, dir);
			yTo = y + lengthdir_x(enemyWanderDistance, dir);
		}
	}
	else{
		timePassed ++;
		var _distanceToGo = point_distance(x,y,xTo,yTo);
		var _speedThisFrame = enemySpeed;
		if(_distanceToGo < enemySpeed) _speedThisFrame = _distanceToGo;
		dir = point_direction(x,y,xTo,yTo);
		hsp = lengthdir_x(_speedThisFrame, dir);
		vsp = lengthdir_y(_speedThisFrame, dir);
		if(hsp != 0) image_xscale = sign(hsp);
		var _collided = EnemyTileCollision();
	}
	
	//Check for aggro
	if(++aggroCheck >= aggroCheckDuration){
		aggroCheck = 0;
		if(instance_exists(oPlayer) and point_distance(x,y,oPlayer.x,oPlayer.y) <= enemyAggroRadius){
			state = ENEMYSTATE.CHASE;
			target = oPlayer;
		}
	}
}