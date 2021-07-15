// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function EnemyState_Dead(){
	if(sprite_index != sEnemyDie){
		sprite_index = sEnemyDie;
		intangible = 1;
		mask_index = sNoHitBox;
		image_speed = 1;
		image_alpha = 1;
		image_index = 0;
	}
	if(image_index>=5){
		image_alpha -= 0.02;
	}

	//CollisionDetection();
	if(animation_end() or image_alpha == 0){
		instance_destroy();
	}
}