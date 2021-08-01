// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function PlayerState_In_Air(){
	if(sprite_index != sJump and sprite_index != sFall){
		image_index = savedJumpIndex;
		sprite_index = sFall;
	}
	if(animation_end(sJump)){
		sprite_index = sFall;
		image_speed = 1;
	}
	if(move!=0){
		image_xscale = move;
	}
	
	PlayerHorizontalMovement();
	Gravity();
	PlayerCollision();

	if(touchingFloor) {
		state = PLAYERSTATE.FREE;
	}
	
	if(keyDash and canDash and hasDash){
		canDash = 0;
		dashDirection = move;
		state = PLAYERSTATE.DASH;
	}
	if(hasWallGrab){
		if(keyRight and !touchingFloor and touchingRWall and vsp>=0){
			state = PLAYERSTATE.WALL_GRAB;
		}
	
		else if(keyLeft and !touchingFloor and touchingLWall and vsp>=0){
			state = PLAYERSTATE.WALL_GRAB;
		}
	}
	
	if(!touchingFloor and keyboard_check_pressed(vk_space) and doubleJmp == 0 and hasDoubleJump){
		jumpDirection = move;
		doubleJmp = 1;
		vsp = -jumpHeight;
		sprite_index = sJump;
		image_index = 0;
		image_speed = 1;
		inJump = 1;
		heightJumped = 0;
	}
	
	if(keyAttack and !inAttackSwingCooldown and hasSword){
		savedJumpIndex = image_index;
		state = PLAYERSTATE.AIR_ATTACK;
		if(keyDown){
			state = PLAYERSTATE.AIR_DOWN_ATTACK;
		}
		else if(keyUp){
			state = PLAYERSTATE.AIR_UP_ATTACK;
		}
	}

}