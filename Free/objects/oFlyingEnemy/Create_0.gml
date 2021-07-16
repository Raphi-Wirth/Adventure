/// @description Insert description here
// You can write your code in this editor
event_inherited();
attackTimer = 0;
airSpeed = 1;
attackCooldownTime = 75;
attackTimer = 0;
inAttackCooldown = 0;
randomX = random_range(x-100,x+100);
randomY = random_range(y-100,y+100);
MoveTo(randomX, randomY, 1);
/*function MoveTo(xPos, yPos){
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
	
}*/

function Attack(){
	image_xscale = DirectionTo(oPlayer.x);
	if(sprite_index != sFlying_Icecream_Attack){
		path_end();
		sprite_index = sFlying_Icecream_Attack;
		image_speed = 2;
		image_index = 0;
	}
	if(bulletWallDetector(oPlayer, sign(oPlayer.x - x), sign(oPlayer.y - y)) == 1){
		state = ENEMYSTATE.CHASE;
		return;
	}
	FlyingBuzzEffect(3);
	CollisionDetection();
	if(animation_end()){ 
		var createdBullet = instance_create_layer(x,y,"Bullets",oBullet);
		var vect = VectorTo(oPlayer.x, oPlayer.y);
		createdBullet.hsp = vect[0];
		createdBullet.vsp = vect[1];
		createdBullet.image_angle = point_direction(x,y,oPlayer.x,oPlayer.y);
		inAttackCooldown = 1;
		attackTimer = 0;
		state = ENEMYSTATE.CHASE;
	}
}
 
function Idle(){
	
	if(path_position == 1){
		path_end();
		randomX = random_range(x-100,x+100);
		randomY = random_range(y-100,y+100);
		MoveTo(randomX, randomY, 1);
	}
	sprite_index = sFlyingEnemy;
	if(distance_to_object(oPlayer) < 100){
		aggrodAtX = x;
		aggrodAtY = y;
		state = ENEMYSTATE.CHASE;
	}
	CollisionDetection()
	if(touchingFloor or touchingRWall or touchingLWall or touchingRoof){
		path_end();
		randomX = random_range(x-100,x+100);
		randomY = random_range(y-100,y+100);
		MoveTo(randomX, randomY, 1);
	}
;
	image_xscale = DirectionTo(randomX);
}

function Chase(){
	image_xscale = DirectionTo(oPlayer.x);
	if(sprite_index != sFlyingEnemy){
		sprite_index = sFlyingEnemy;
	}
	if(path_index != oPlayer){
		path_end();
		MoveTo(oPlayer.x,oPlayer.y,3);
	}
	CollisionDetection();
	if(distance_to_object(oPlayer) < 200
	and !bulletWallDetector(oPlayer, sign(oPlayer.x-x), sign(oPlayer.y-y))
	and !inAttackCooldown){
		state = ENEMYSTATE.ATTACK;
	}
	if(distance_to_object(oPlayer) > 300){
		state = ENEMYSTATE.IDLE;
	}
}

function Hit(){
	path_end();
	if(sprite_index != sFlyingEnemy){
		sprite_index = sFlyingEnemy;
	}
	if(flashAlpha > 0){
		flashAlpha -= 0.05;
	}
	else if(flashAlpha == 0){
		state = ENEMYSTATE.CHASE;
	}
}