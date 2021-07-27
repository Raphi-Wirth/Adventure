// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function PlayerState_Ground_Up_Attack(){
	image_speed = 1;

	//Start of the attack

	if (sprite_index != sGround_Up_Attack_Slash)
	{
		sprite_index = sGround_Up_Attack_Slash;
		image_index = 0;
		ds_list_clear(hitByAttack);
	}

	PlayerHorizontalMovement();
	

	CalcAttack(sGround_Up_Attack_SlashHB);
	PlayerHorizontalMovement();
	Gravity();
	PlayerCollision();
	

	if(animation_end()){
		inAttackSwingCooldown = 1;
		state = PLAYERSTATE.FREE;
	}
}