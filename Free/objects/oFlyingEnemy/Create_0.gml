/// @description Insert description here
// You can write your code in this editor
event_inherited();
flyingSpeed = 4;
attackTimer = 0;
airSpeed = 1;
attackCooldownTime = 50;
attackTimer = 0;
inAttackCooldown = 0;

function MoveTo(){
	switch (state) {
		case ENEMYSTATE.CHASE: airSpeed = 3; image_xscale = 1;  break;
		
		case ENEMYSTATE.ATTACK: airSpeed = 0.5; image_xscale = 1; break;
	}
	if(sprite_index != sFlyingEnemy){
		image_xscale = 1;
		sprite_index = sFlyingEnemy;
	}
	var vect = VectorTo(oPlayer);
	hsp = vect[0]*airSpeed;
	vsp = vect[1]*airSpeed;
	CollisionDetection();

	x += hsp;
	y += vsp;
	
	if(sqrt(sqr(oPlayer.x - x) + sqr(oPlayer.y - y)) > 500){
		state = ENEMYSTATE.IDLE;
	}
	else if(sqrt(sqr(oPlayer.x - x) + sqr(oPlayer.y - y)) < 200){
		if(bulletWallDetector(oPlayer, sign(oPlayer.x - x), sign(oPlayer.y - y)) == 0){
			state = ENEMYSTATE.ATTACK;
		}
		else{
			state = ENEMYSTATE.CHASE;
		}
	}
	else{
		state = ENEMYSTATE.CHASE;
	}
}

function Attack(){
	if(sprite_index != sFlyingEnemy){
		sprite_index = sFlyingEnemy;
	}
	if(!inAttackCooldown){
		inAttackCooldown = 1;
		attackTimer = 0;
		var createdBullet = instance_create_layer(x,y,"Bullets",oBullet);
		var vect = VectorTo(oPlayer);
		createdBullet.hsp = vect[0];
		createdBullet.vsp = vect[1];
		createdBullet.image_angle = point_direction(x,y,oPlayer.x,oPlayer.y);
	}
	MoveTo();
}