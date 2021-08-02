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
	if(touchingRoof){
		inJump = 0;
	}
	if(heightJumped >= 64*2 and inJump){
		if(!keyJump){
			inJump = 0;
			vsp = 0;
		}
		if(keyJump and heightJumped < maxJumpHeight){
			y -= ((maxJumpHeight - heightJumped)/maxJumpHeight) * 20 + 10;
			vsp = 0;
			heightJumped += ((maxJumpHeight - heightJumped)/maxJumpHeight) * 20 + 10;
		}
		if(keyJump and heightJumped >= maxJumpHeight){
			vsp = -5;
			inJump = 0;
		}
	}
	if(!touchingFloor and keyboard_check_pressed(vk_space) and doubleJmp == 0 and hasDoubleJump){
		jumpDirection = move;
		doubleJmp = 1;
		part_particles_create(global.partSystem, oPlayer.x, oPlayer.y+5, global.ptJump, 1);
		sprite_index = sJump;
		image_index = 0;
		image_speed = 1;
		vsp = -30;
		inJump = 1;
		heightJumped = 30;
	}
	
	Gravity();
	PlayerHorizontalMovement();
	PlayerCollision();
	
	heightJumped -= vsp;
	
	
	
	if(touchingFloor){
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