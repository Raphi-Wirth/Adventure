// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function PlayerState_Ground_Attack(){
	image_speed = 1;

	//Start of the attack
	if (sprite_index != argument0)
	{
		sprite_index = argument0;
		image_index = 0;
		ds_list_clear(hitByAttack);
	}
	CalcAttack(argument1);
	PlayerHorizontalMovement();
	Gravity();
	PlayerCollision();
	if(hsp != 0){
		bottomSprite = sPlayerLegsWalk;
		bottomSpriteImageIndex += 0.2;
		if(bottomSpriteImageIndex >= image_number){
			bottomSpriteImageIndex = 0;
		}
	}
	else{
		if(bottomSprite != sPlayerLegsIdle){
			bottomSpriteImageIndex = 0;
			bottomSprite = sPlayerLegsIdle;
		}
		bottomSpriteImageIndex += 0.133;
		if(bottomSpriteImageIndex >= image_number){
			bottomSpriteImageIndex = 0;
		}
	}

	
	if(animation_end(sprite_index)){
		bottomSprite = -1;
		if(abs(hsp) > 0){
			sprite_index = sWalk;
			image_index = bottomSpriteImageIndex;
		}
		else{
			sprite_index = sIdle;
		}
		inAttackSwingCooldown = 1;
		state = PLAYERSTATE.FREE;
	}
}