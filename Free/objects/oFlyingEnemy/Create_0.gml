/// @description Insert description here
// You can write your code in this editor
event_inherited();
flyingSpeed = 4;
attackTimer = 0;
attackCooldown = 60;
function MoveTo(){
	if(sprite_index != sFlyingEnemy){
		image_xscale = 1;
		sprite_index = sFlyingEnemy;
	}
	var vect = VectorTo(oPlayer);
	hsp = vect[0];
	vsp = vect[1];
	CollisionDetection();

	x += hsp;
	y += vsp;
	
	if(sqrt(sqr(oPlayer.x - x) + sqr(oPlayer.y - y)) > 300){
		state = ENEMYSTATE.IDLE;
	}
	if(sqrt(sqr(oPlayer.x - x) + sqr(oPlayer.y - y)) < 100){
		state = ENEMYSTATE.ATTACK;
	}
}

function Attack(){
	if(sprite_index != sFlyingEnemy){
		sprite_index = sFlyingEnemy;
		image_xscale = 1.2;
	}
	if(attackTimer < attackCooldown){
		attackTimer += 1;
	}
	else{
		attackTimer = 0;
		var createdBullet = instance_create_layer(x,y,"Bullets",oBullet);
		var vect = VectorTo(oPlayer);
		createdBullet.hsp = vect[0];
		createdBullet.vsp = vect[1];
		createdBullet.image_angle = point_direction(x,y,oPlayer.x,oPlayer.y);
	}
	MoveTo();
}