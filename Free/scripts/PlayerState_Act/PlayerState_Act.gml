// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function PlayerState_Act(){
	if(sprite_index != actSprite){
		sprite_index = actSprite;
		image_index = 0;
		image_speed = 1;
	}
	if(canMoveWhileAct == 1){
		PlayerHorizontalMovement();
		Gravity();
		if(touchingFloor and keyJump and (!(touchingRWall and wallJumpDirection) or !(touchingLWall and wallJumpDirection)))
		{
			state = PLAYERSTATE.JUMP_SQUAT;
		}
		PlayerDash();
	}
	PlayerCollision();
	if(animation_end()){
		if(animationEndScript != undefined and animationEndScript != -1){
			script_execute(animationEndScript);
			animationEndScript = -1;
		}
		if(state == PLAYERSTATE.ACT){
			state = PLAYERSTATE.FREE;
		}

		canMoveWhileAct = 0;
	}

}