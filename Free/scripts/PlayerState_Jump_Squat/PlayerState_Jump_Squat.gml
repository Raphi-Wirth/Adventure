// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function PlayerState_Jump_Squat(){
	if(sprite_index!=sJumpSquat){
		sprite_index = sJumpSquat;
		image_index = 0;
		image_speed = 4;
	}
	PlayerHorizontalMovement();
	if(image_index >= 4){
		sprite_index = sJump;
		image_speed = 1;
		image_index = 0;
		vsp = -25;
		state = PLAYERSTATE.IN_AIR;
	}
	PlayerCollision();
}