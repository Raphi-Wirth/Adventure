// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function FlyingIcecreamWander(){
	sprite_index = sprMove;
	image_speed = 1;
	
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

function FlyingIcecreamChase(){
	sprite_index = sprMove;
	
	if(instance_exists(target)){
		xTo = target.x;
		yTo = target.y - target.sprite_height/2;
		var _distanceToGo = point_distance(x,y,xTo,yTo);
		image_speed = 1;
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
	if(instance_exists(target) and point_distance(x,y,target.x,target.y) >= enemyDeAggroRadius){
		stateTarget = ENEMYSTATE.WANDER;
		stateWaitDuration = 15;
		state = ENEMYSTATE.WAIT;
	}
}

function FlyingIcecreamAttack(){
	var _spd = enemySpeed;
	
	if(instance_exists(target)){
		xTo = target.x;
		yTo = target.y - target.sprite_height/2;
		var _distanceToGo = point_distance(x,y,xTo,yTo);
		image_speed = 1;
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

	if(animation_end()){	
		with(instance_create_layer(x,y,"Instances", oFlyingIcreamBullet)){
			xTo = oPlayer.x;
			yTo = oPlayer.y;
			if(other.enemyProjectileSpeed != 0){
				bulletSpeed = other.enemyProjectileSpeed;
			}
			force = other.enemyProjectileKnockback;
			damage = other.enemyProjectileDamage;
			dir = point_direction(x,y,xTo,yTo);
			image_angle = dir;
		}
		stateTarget = ENEMYSTATE.CHASE;
		stateWaitDuration = 60;
		state = ENEMYSTATE.WAIT;
	}
}
	
function FlyingIcecreamHurt(){
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

function FlyingIcecreamDie(){
	sprite_index = sprDie;
	image_speed = 1;
	var _distanceToGo = point_distance(x,y,xTo,yTo);
	if (_distanceToGo > enemySpeed){
		dir = point_direction(x,y,xTo,yTo);
		hsp = lengthdir_x(enemySpeed, dir);
		vsp = lengthdir_y(enemySpeed, dir);
		if(hsp != 0){
			image_xscale = -sign(hsp);
		}
		EnemyTileCollision();
	}
	else{
		x = xTo;
		y = yTo;
	}
	if (animation_end()){
		part_particles_create(global.partSystem, x, y, global.ptBasic, 1);
		instance_destroy();
	}
}