// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function PlayerState_In_Air(){

	
	PlayerAerialMovement();
	Gravity();
	PlayerHorizontalMovement();
	PlayerCollision();
	
	if(!touchingFloor and keyJump and doubleJmp == 0 and hasDoubleJump){
		jumpDirection = move;
		doubleJmp = 1;
		part_particles_create(global.partSystem, oPlayer.x, oPlayer.y+5, global.ptJump, 1);
		sprite_index = sJump;
		image_index = 0;
		image_speed = 1;
		vsp = -30;
		inJump = 1;
		heightJumped = -vsp;
	}
	
	
	if(touchingFloor){
		state = PLAYERSTATE.FREE;
	}
	
	if(keyDash and canDash and hasDash){
		canDash = 0;
		dashDirection = move;
		state = PLAYERSTATE.DASH;
	}
	if(hasWallGrab and !inJump){
		if(keyRight and !touchingFloor and touchingRWall){
			state = PLAYERSTATE.WALL_GRAB;
		}
	
		else if(keyLeft and !touchingFloor and touchingLWall){
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