// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function PlayerState_In_Air(){
	
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
	
	if(!touchingFloor and keyJump and doubleJmp == 0 and hasDoubleJump){
		jumpDirection = move;
		state = PLAYERSTATE.DOUBLE_JUMP;
	}
	
	if(keyAttack and !inAttackSwingCooldown and hasSword){
		state = PLAYERSTATE.AIR_ATTACK;
		if(keyDown){
			state = PLAYERSTATE.AIR_DOWN_ATTACK;
		}
		else if(keyUp){
			state = PLAYERSTATE.AIR_UP_ATTACK;
		}
	}

	
	if(vsp<0){
		sprite_index = sJump;
		if(vsp<-7){
			image_index = 0;
		}
		else if (vsp < -3 and vsp >= -7){
			image_index = 1;
		} 
		else if (vsp < 0 and vsp >= -3){
			image_index = 2;
		}
	}

	if(vsp >= 0){
		sprite_index = sFall;
		if (vsp >= 0 and vsp < 2){
			image_index = 0;
		}
		else if (vsp >= 2){
			image_index = 1;
		}
	}		
}