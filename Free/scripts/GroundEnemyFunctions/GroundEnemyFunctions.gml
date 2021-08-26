
function GroundEnemyWander(){
	sprite_index = sprMove;
	image_speed = 1;
	Gravity();
	//At destination or taken too long
	if(x==xTo){
		show_debug_message("Enemy at target");
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
		show_debug_message("X: " + string(x));
		show_debug_message("xTo: " + string(xTo));
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
	if(++aggroCheck >= aggroCheckDuration){
		aggroCheck = 0;
		if(instance_exists(oPlayer) and abs(oPlayer.x - x) <= enemyAggroRadius and abs(oPlayer.y - y) < 100){
			state = ENEMYSTATE.CHASE;
			target = oPlayer;
		}
	}
}

function GroundEnemyChase(){
	sprite_index = sprMove;
	Gravity();
	image_speed = 1;
	if(instance_exists(target)){
		xTo = target.x;
		var _distanceToGo = xTo - x;
		var _speedThisFrame = enemySpeed;
		if(abs(_distanceToGo) < enemySpeed) _speedThisFrame = abs(_distanceToGo);
		hsp = _speedThisFrame * sign(_distanceToGo);
		if(hsp != 0) image_xscale = sign(hsp);
		hsp = sign(_distanceToGo)*_speedThisFrame;
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
	if(instance_exists(target) and point_distance(x,y,target.x,target.y) >= enemyDeAggroRadius){
		stateTarget = ENEMYSTATE.WANDER;
		stateWaitDuration = 15;
		state = ENEMYSTATE.WAIT;
	}
}

function GroundEnemyAttack(){
	sprite_index = sprMove;
	Gravity();
	image_speed = 1;
	if(instance_exists(target)){
		xTo = target.x;
		var _distanceToGo = xTo - x;
		var _speedThisFrame = 2*enemySpeed;
		if(abs(_distanceToGo) < 2*enemySpeed) _speedThisFrame = abs(_distanceToGo);
		hsp = _speedThisFrame * sign(_distanceToGo);
		if(hsp != 0) image_xscale = sign(hsp);
		hsp = sign(_distanceToGo)*_speedThisFrame;
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
	if(instance_exists(target) and point_distance(x,y,target.x,target.y) >= enemyDeAggroRadius){
		stateTarget = ENEMYSTATE.WANDER;
		stateWaitDuration = 15;
		state = ENEMYSTATE.WAIT;
	}
}

function GroundEnemyHurt(){
	sprite_index = sprHurt;
	var _distanceToGo = point_distance(x,y,xTo,yTo);
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
		x = xTo;
		y = yTo;
		if(statePrevious != ENEMYSTATE.ATTACK){
			state = statePrevious;
		}
		else{
			state = ENEMYSTATE.CHASE;
		}
	}
}
 
function GroundEnemyDie(){
	mask_index = sNoHitBox;
	sprite_index = sprDie;
	image_speed = 1;
	Gravity()
	EnemyTileCollision();
	image_alpha = max(image_alpha - 0.025, 0);
	if(image_alpha <= 0){
		instance_destroy();
	}
}