// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information

function GroundEnemyWander(){
	show_debug_message(xTo);
	show_debug_message(x);
	sprite_index = sprMove;
	image_speed = 1;
	Gravity();
	//At destination or taken too long
	if(x==xTo or timePassed >= 500){
		hsp = 0;
		//End move animation
		sprite_index = sprIdle;
	
		//Set new target destination
		if(++wait >= waitDuration){
			wait = 0;
			timePassed = 0;
			xTo = floor(xstart + irandom_range(-1,1)*random_range(enemyWanderDistance/2,enemyWanderDistance));
		}
	}
	else{
		timePassed ++;
		var _distanceToGo = xTo - x;
		var _speedThisFrame = enemySpeed;
		if(abs(_distanceToGo) < enemySpeed) _speedThisFrame = abs(_distanceToGo);
		hsp = _speedThisFrame * sign(_distanceToGo);
		if(hsp != 0) image_xscale = sign(hsp);
	}
	if(enemyFallOffLedge or enemyTouchingWall){
		xTo = xstart - sign(hsp)*random(enemyWanderDistance);
		hsp = 0;
	}
	var _collided = EnemyTileCollision();


	//Check for aggro
	if(++aggroCheck >= aggroCheckDuration and enemyScript[ENEMYSTATE.CHASE] != -1){
		aggroCheck = 0;
		if(instance_exists(oPlayer) and abs(oPlayer.x - x) <= enemyAggroRadius and abs(oPlayer.y - y) < 100){
			state = ENEMYSTATE.CHASE;
			target = oPlayer;
		}
	}
}

function GroundEnemyChase(){
	sprite_index = sprChase;
	Gravity();
	image_speed = 1;
	if(instance_exists(target)){
		xTo = target.x;
		var _distanceToGo = xTo - x;
		var _speedThisFrame = 2*enemySpeed;
		if(abs(_distanceToGo) < enemySpeed) _speedThisFrame = abs(_distanceToGo);
		hsp = _speedThisFrame * sign(_distanceToGo);
		if(hsp != 0) image_xscale = sign(hsp);
		hsp = sign(_distanceToGo)*_speedThisFrame;
		if(hsp != 0){
			image_xscale = sign(hsp);
		}
		//Collide and move
		if(enemyFallOffLedge or enemyTouchingWall){
			hsp = 0;
		}
		EnemyTileCollision();
	}
	if(instance_exists(oPlayer) and abs(oPlayer.x - x) <= enemyAttackRadius and enemyScript[ENEMYSTATE.ATTACK] != -1 and !inAttackCooldown){
		state = ENEMYSTATE.ATTACK;
	}
	if(instance_exists(target) and point_distance(x,y,target.x,target.y) >= enemyDeAggroRadius){
		stateTarget = ENEMYSTATE.WANDER;
		stateWaitDuration = 15;
		state = ENEMYSTATE.WAIT;
	}
}


function GroundEnemyHurt(){
	sprite_index = sprHurt;
	Gravity();
	var _distanceToGo = point_distance(x,y,xTo,yTo);
	if(enemyKnockbackSpeed == 0){
		state = ENEMYSTATE.CHASE;
		target = oPlayer;
		return;
	}
	if (_distanceToGo > enemyKnockbackSpeed){
		image_speed = 1;
		dir = point_direction(x,y,xTo,yTo);
		hsp = lengthdir_x(enemyKnockbackSpeed, dir);
		vsp = lengthdir_y(enemyKnockbackSpeed, dir);
		if(hsp != 0){
			image_xscale = -sign(hsp);
		}
		
		//Collide and move
		if(EnemyTileCollision()){
			xTo = x;
			yTo = y;
		}
	}
	else{
		show_debug_message("Enemy at final hurt point");
		x = xTo;
		y = yTo;
		if(statePrevious != ENEMYSTATE.ATTACK){
			state = statePrevious;
			target = oPlayer;
		}
		else{
			state = ENEMYSTATE.CHASE;
		}
	}
}