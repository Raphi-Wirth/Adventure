/// @description Insert description here
// You can write your code in this editor
event_inherited();
attackTimer = 0;
attackCooldownTime = 75;
bulletSpeed = 10;
attackTimer = 0;
inAttackCooldown = 0;
lastAttackIndex = 0;
randomX = random_range(x-100,x+100);
randomY = random_range(y-100,y+100);
MoveTo(randomX, randomY, 1);


function Attack(){
	if(DirectionTo(oPlayer.x) != 0){
		image_xscale = DirectionTo(oPlayer.x);
	}
	if(sprite_index != sFlying_Icecream_Attack){
		path_end();
		sprite_index = sFlying_Icecream_Attack;
		image_speed = 1;
		if(lastAttackIndex > sprite_get_number(sFlying_Icecream_Attack)){
			lastAttackIndex = 0;
		}
		image_index = lastAttackIndex;
	}
	if(bulletWallDetector(oPlayer, sign(oPlayer.x - x), sign(oPlayer.y - y)) == 1){
		state = ENEMYSTATE.CHASE;
	}
	FlyingBuzzEffect(3);
	CollisionDetection();
	lastAttackIndex += 1;
	if(animation_end()){ 
		var createdBullet = instance_create_layer(x,y,"Bullets",oBullet)
		createdBullet.bulletSpeed = bulletSpeed;
		var timeToPlayer = abs(point_distance(x,y, oPlayer.x, oPlayer.y))/bulletSpeed;
		var vect = VectorTo(oPlayer.x + timeToPlayer*oPlayer.hsp, oPlayer.y + timeToPlayer*oPlayer.vsp);
		createdBullet.hsp = vect[0];
		createdBullet.vsp = vect[1];
		createdBullet.image_angle = point_direction(x,y, oPlayer.x + timeToPlayer*oPlayer.hsp, oPlayer.y + timeToPlayer*oPlayer.vsp);
		lastAttackIndex = 0;
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
	if(distance_to_object(oPlayer) < 250){
		aggrodAtX = x;
		aggrodAtY = y;
		state = ENEMYSTATE.CHASE;
	}
	CollisionDetection();
	if(touchingFloor or touchingRWall or touchingLWall or touchingRoof){
		path_end();
		randomX = random_range(x-100,x+100);
		randomY = random_range(y-100,y+100); 
		MoveTo(randomX, randomY, 1);
	}
	image_xscale = DirectionTo(randomX);
}

function Chase(){
	if(DirectionTo(oPlayer.x) != 0){
		image_xscale = DirectionTo(oPlayer.x);
	}
	if(sprite_index != sFlyingEnemy){
		sprite_index = sFlyingEnemy;
	}
	if(path_index != oPlayer){
		path_end();
		MoveTo(oPlayer.x,oPlayer.y,3);
	}
	CollisionDetection();
	if(distance_to_object(oPlayer) < 400
	and !bulletWallDetector(oPlayer, sign(oPlayer.x-x), sign(oPlayer.y-y))
	and !inAttackCooldown){
		state = ENEMYSTATE.ATTACK;
	}
	if(distance_to_object(oPlayer) > 600){
		state = ENEMYSTATE.IDLE;
	}
}

function Hit(){
	path_end();
	CollisionDetection();
	if(sprite_index != sFlyingEnemy){

		sprite_index = sFlyingEnemy;
		image_index = 0;
		image_speed = 0;
	}
	if(flashAlpha > 0){
		flashAlpha -= 0.05;
	}
	else if(flashAlpha == 0){
		state = ENEMYSTATE.CHASE;
	}
}

function Dead(){
	if(sprite_index != sEnemyDie){
		sprite_index = sEnemyDie;
		path_end();
	}
	CollisionDetection();
	Gravity();
	if(animation_end()){
		instance_destroy();
	}
}