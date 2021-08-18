// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function PlayerState_Jump_Squat(){
	PlayerHorizontalMovement();
	sprite_index = sJump;
	image_speed = 1;
	image_index = 0;
	doubleJmp = 0;
	canDash = 1;
	savedJumpIndex = 0;
	vsp = -30;
	heightJumped = -vsp;
	inJump = 1;
	state = PLAYERSTATE.IN_AIR;
	PlayerCollision();
	PlayerDash();
}