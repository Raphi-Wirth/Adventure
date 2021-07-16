/// @description Insert description here
// You can write your code in this editor
event_inherited();
attackTimer = 0;
airSpeed = 1;
attackCooldownTime = 75;
attackTimer = 0;
inAttackCooldown = 0;
randomX = x;
randomY = y;

function MoveTo(xPos, yPos){
	switch (state) {
		case ENEMYSTATE.CHASE: airSpeed = 2; break;
		
		case ENEMYSTATE.ATTACK: airSpeed = 0.25; break;
		
		case ENEMYSTATE.IDLE: airSpeed = 0.5; break;
	}
	if(sprite_index != sFlyingEnemy){
		image_xscale = 1;
		sprite_index = sFlyingEnemy;
	}
	var vect = VectorTo(xPos, yPos);
	hsp = vect[0]*airSpeed;
	vsp = vect[1]*airSpeed;
	CollisionDetection();

	x += hsp;
	y += vsp;
	
}

function Attack(){
	if(sprite_index != sFlyingEnemy){
		sprite_index = sFlyingEnemy;
	}
	inAttackCooldown = 1;
	attackTimer = 0;
	var createdBullet = instance_create_layer(x,y,"Bullets",oBullet);
	var vect = VectorTo(oPlayer.x, oPlayer.y);
	createdBullet.hsp = vect[0];
	createdBullet.vsp = vect[1];
	createdBullet.image_angle = point_direction(x,y,oPlayer.x,oPlayer.y);
	MoveTo(oPlayer.x, oPlayer.y);
	state = ENEMYSTATE.CHASE;
}

function Idle(){
	if(distance_to_point(randomX, randomY)<10){
		randomX = random_range(x-100,x+100);
		randomY = random_range(y-100,y+100);
	}
	sprite_index = sFlyingEnemy;
	CollisionDetection();
	if(distance_to_object(oPlayer) < 200){
		aggrodAtX = x;
		aggrodAtY = y;
		state = ENEMYSTATE.CHASE;
	}
	MoveTo(randomX, randomY);
	if(touchingFloor or touchingRWall or touchingLWall or touchingRoof){
		randomX = random_range(x-100,x+100);
		randomY = random_range(y-100,y+100);
	}
}

function Chase(){
	MoveTo(oPlayer.x, oPlayer.y);
	if(distance_to_object(oPlayer) < 100
	and !bulletWallDetector(oPlayer, sign(oPlayer.x-x), sign(oPlayer.y-y))
	and !inAttackCooldown){
		state = ENEMYSTATE.ATTACK;
	}
	if(distance_to_object(oPlayer) > 500){
		state = ENEMYSTATE.IDLE;
	}
}