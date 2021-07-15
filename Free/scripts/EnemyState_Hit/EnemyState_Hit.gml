// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function EnemyState_Hit(){
	if(sprite_index != sEnemyHit){
		sprite_index = sEnemyHit;
	}
	if(flashAlpha > 0){
		flashAlpha -= 0.05;
	}
	else if(flashAlpha == 0){
		state = ENEMYSTATE.CHASE;
	}
	if(abs(hsp)>0.5){
		hsp -= 0.5*sign(hsp);
	}
	else if(abs(hsp) <= 0.5){
		hsp = 0;
	}
	Gravity();
	CollisionDetection();
	x+=hsp;
	y+=vsp;
}