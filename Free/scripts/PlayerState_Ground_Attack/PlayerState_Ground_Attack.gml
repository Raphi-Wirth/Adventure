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
		image_xscale = sign(hsp);
	}
	else{
		bottomSpriteImageIndex = 0;
		bottomSprite = sPlayerLegsIdle;
	}

	
	if(animation_end(sprite_index)){
		bottomSpriteImageIndex = (bottomSpriteImageIndex + sprite_get_number(bottomSprite)) mod image_number;
		bottomSprite = -1;
		if(abs(hsp) > 0){
			sprite_index = sWalk;
			image_index = bottomSpriteImageIndex;
		}
		else{
			sprite_index = sIdle;
		}
		show_debug_message("After animation end: " + string(bottomSpriteImageIndex));
		inAttackSwingCooldown = 1;
		state = PLAYERSTATE.FREE;
	}
}