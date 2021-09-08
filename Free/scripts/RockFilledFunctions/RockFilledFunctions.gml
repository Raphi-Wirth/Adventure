// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function RockFilledSmash(){
	if(sprite_index != sprAttack){
		hsp = 0;
		vsp = 0;
		inAttackCooldown = 1;
		sprite_index = sprAttack;
		image_xscale = sign(oPlayer.x-x);
		image_index = 0;
		image_speed = 1;
		ds_list_clear(hitByAttack);
	}
	Gravity();
	if(enemyFallOffLedge or enemyTouchingWall){
		xTo = xstart - sign(hsp)*random(enemyWanderDistance);
		hsp = 0;
	}
	EnemyTileCollision();
	EnemyCalcAttack(sRockFilledSmashHB);
	if(animation_end()){
		for(var i = -4; i < 4; i++){
			instance_create_layer(oPlayer.x + 400*i, 0, "Instances",oRock)
		}
		state = ENEMYSTATE.CHASE;
	}
}

function RockFilledChase(){
	if(round(x)==round(xTo)){
		sprite_index = sprIdle;
	}
	else{
		sprite_index = sprChase;
	}
	Gravity();
	image_speed = 1;
	if(instance_exists(target)){
		xTo = target.x + sign(x-target.x)*400;
		var _distanceToGo = xTo - x;
		var _speedThisFrame = 2*enemySpeed;
		if(abs(_distanceToGo) < enemySpeed) _speedThisFrame = abs(_distanceToGo);
		hsp = _speedThisFrame * sign(_distanceToGo);
		if(hsp != 0) image_xscale = sign(hsp);
		hsp = sign(_distanceToGo)*_speedThisFrame;
		if(hsp != 0){
			image_xscale = sign(target.x-x);
		}
		//Collide and move
		if(enemyFallOffLedge or enemyTouchingWall){
			hsp = 0;
		}
		EnemyTileCollision();
	}
	if(instance_exists(oPlayer) and x==xTo and enemyScript[ENEMYSTATE.ATTACK] != -1){
		state = ENEMYSTATE.ATTACK;
		enemyScript[ENEMYSTATE.ATTACK] = RockFilledSmash;
	}
	if(instance_exists(oPlayer) and abs(oPlayer.x - x) >= 600 and enemyScript[ENEMYSTATE.ATTACK] != -1 and !inAttackCooldown){
		state = ENEMYSTATE.ATTACK;
		enemyScript[ENEMYSTATE.ATTACK] = RockFilledHammerThrow;
	}
	if(instance_exists(target) and point_distance(x,y,target.x,target.y) >= enemyDeAggroRadius){
		stateTarget = ENEMYSTATE.WANDER;
		stateWaitDuration = 15;
		state = ENEMYSTATE.WAIT;
	}
}

function RockFilledHammerThrow(){
	if(sprite_index != sprAttackThrow){
		sprite_index = sprAttackThrow;
		image_index = 0;
		image_speed = 1;
		hsp = 0;
		vsp = 0;
	}
	Gravity();
	EnemyTileCollision();
	if(image_index == 8){
		with(instance_create_layer(x,y-sprite_height/2,"Instances", oHammerArms)){
			hsp = other.enemyProjectileSpeed*sign(oPlayer.x-other.x);
			image_xscale = sign(oPlayer.x-other.x);
		}
	}
	if(animation_end()){
		sprMove = sRockFilledArmlessMove;
		enemyScript[ENEMYSTATE.CHASE] = ChaseHammer;
		state = ENEMYSTATE.CHASE;
	}
}

function ChaseHammer(){
	sprite_index = sprMove;
	if(instance_exists(oHammerArms)){
		xTo = oHammerArms.x;
		var _distanceToGo = xTo - x;
		var _speedThisFrame = 4*enemySpeed;
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
	if(abs(x-xTo)<=300){
		enemyScript[ENEMYSTATE.CHASE] = RockFilledChase;
		inAttackCooldown = 1;
		sprMove = sRockFilledMove;
		instance_destroy(oHammerArms);
		return;
	}
}
	
