/// @description Insert description here
// You can write your code in this editor
event_inherited();
flyingSpeed = 4;

function MoveTo(){
	if(sprite_index != sFlyingEnemy){
		sprite_index = sFlyingEnemy;
	}
	moveX = oPlayer.x - x;
	moveY = oPlayer.y - y;
	len = sqrt(sqr(moveX) + sqr(moveY));
	moveX = moveX/len;
	moveY = moveY/len;
	
	hsp = moveX * flyingSpeed;
	vsp = moveY * flyingSpeed;

	CollisionDetection();
	
	
	x += hsp;
	y += vsp;
	
	if(sqrt(sqr(oPlayer.x - x) + sqr(oPlayer.y - y)) > 300){
		state = ENEMYSTATE.IDLE;
	}
}