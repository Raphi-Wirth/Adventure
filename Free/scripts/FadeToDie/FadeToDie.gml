// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function FadeToDie(){
	mask_index = sNoHitBox;
	sprite_index = sprDie;
	image_speed = 1;
	Gravity();
	EnemyTileCollision();
	image_alpha = max(image_alpha - 0.025, 0);
	if(image_alpha <= 0){
		instance_destroy();
	}
}