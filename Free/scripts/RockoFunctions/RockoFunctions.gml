// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function RockoAttack(){
	if(sprite_index != sprAttack){
		sprite_index = sprAttack;
		image_index = 0;
		image_speed = 1;
	}
	hsp = 0;
	image_xscale = sign(oPlayer.x-x);
	Gravity();
	EnemyTileCollision();
	if(image_index == 10){	
		with(instance_create_layer(x + 20*image_xscale,y-sprite_height/2,"Instances", oBullet)){
			xTo = oPlayer.x;
			yTo = oPlayer.y-75;
			if(other.enemyProjectileSpeed != 0){
				bulletSpeed = other.enemyProjectileSpeed;
			}
			force = other.enemyProjectileKnockback;
			damage = other.enemyProjectileDamage;
			dir = point_direction(x,y,xTo,yTo);
			sprite_index = sFragRock;
			image_xscale = 2;
			image_yscale = 2;
			image_speed = 0;
			depth = other.depth - 1;
			image_index = choose(0,1,2);
			image_angle = dir;
		}
	}
	if(animation_end()){
		if(abs(point_distance(x,y,oPlayer.x,oPlayer.y)) >= enemyDeAggroRadius){
			stateTarget = ENEMYSTATE.CHASE;
		}
		else{
			stateTarget = ENEMYSTATE.ATTACK;
		}

		stateWaitDuration = 60;
		state = ENEMYSTATE.WAIT;
	}
}