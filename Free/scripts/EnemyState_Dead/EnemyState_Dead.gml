// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function EnemyState_Dead(){
	if(sprite_index != sEnemyDie){
		sprite_index = sEnemyDie;
		image_speed = 1;
	}

	image_alpha -= 0.005;
	//CollisionDetection();
	if(animation_end()){
		instance_destroy();
	}
}