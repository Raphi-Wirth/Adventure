// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function PlayerState_Air_Attack(){
	image_speed = 1;

	//Start of the attack

	if (sprite_index != argument0)
	{
		sprite_index = argument0;
		image_index = 0;
		ds_list_clear(hitByAttack);
	}
	
	CalcAttack(argument1);
	PlayerAerialMovement();
	PlayerHorizontalMovement();
	Gravity();
	PlayerCollision();
	
	
	if(touchingFloor){
		HitGroundDust();
		inAttackSwingCooldown = 1;
		state = PLAYERSTATE.FREE;
	}
	
	if(animation_end()){
		inAttackSwingCooldown = 1;
		sprite_index = sFall;
		state = PLAYERSTATE.IN_AIR;
	}
}