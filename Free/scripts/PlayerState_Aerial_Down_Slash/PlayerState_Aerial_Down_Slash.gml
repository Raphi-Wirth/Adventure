// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function PlayerState_Aerial_Down_Slash(){

	image_speed = 1;

	//Start of the attack

	if (sprite_index != sAerial_Down_Slash)
	{
		show_debug_message("We in here?");
		sprite_index = sAerial_Down_Slash;
		image_index = 0;
		ds_list_clear(hitByAttack);
	}
	CalcAttack(sAerial_Down_SlashHB);
	PlayerAerialMovement();
	PlayerHorizontalMovement();
	Gravity();
	PlayerCollision();
	
	if(touchingFloor){
		inAttackSwingCooldown = 1;
		state = PLAYERSTATE.FREE;
	}
	
	if(animation_end()){
		inAttackSwingCooldown = 1;
		sprite_index = sFall;
		state = PLAYERSTATE.IN_AIR;
	}
}