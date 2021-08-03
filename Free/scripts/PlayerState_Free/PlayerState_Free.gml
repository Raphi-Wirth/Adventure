function PlayerState_Free(){
	//Movement mechanics
	//Horizontal Movement
	
	PlayerHorizontalMovement();
	//This state uses gravity
	Gravity();
	PlayerCollision();
	
	if(keyInteract){
		//1. Check for an entity to actiave
		//2. If there is nothing, or there is something with no script - do nothing
		//3. Otherwise, activate script
		//4. If the thing we activate is an NPC, make it face towards us
		var _activateX = lengthdir_x(40, direction) + x;
		var _activateY = lengthdir_y(40, direction) + y;
		var _activateSize = 20;
		var _activateList = ds_list_create();
		activate = noone;
		
		var _entitiesFound = collision_rectangle_list(
			_activateX - _activateSize,
			_activateY - _activateSize,
			_activateX + _activateSize,
			_activateY + _activateSize,
			pEntity,
			false,
			true,
			_activateList,
			true
		);

		//If the first instance we find has no script, try next
		while (_entitiesFound > 0){
			var _check = _activateList[| --_entitiesFound];
			if(_check.entityActivateScript != -1){
				activate = _check;
				break;
			}
		}
		
		ds_list_destroy(_activateList);

		if(activate != noone){
			//Activate that entities specifc scripts with its specific arguments
			show_debug_message("Has script");
			ScriptExecuteArray(activate.entityActivateScript, activate.entityActivateArgs);
			if(activate.entityNPC){
				with(activate){
					direction = point_direction(x,y,other.x,other.y);
					image_index = CARDINAL_DIR;
				}
			}
		}
	}
	
	
	if(touchingFloor){
		doubleJmp = 0;
		canDash = 1;
	}
	else if(!touchingFloor){
		state = PLAYERSTATE.IN_AIR;
	}

	//Jump if on floor and not touching a wall
	if(touchingFloor and keyJump and (!(touchingRWall and wallJumpDirection) or !(touchingLWall and wallJumpDirection)))
	{
		state = PLAYERSTATE.JUMP_SQUAT;
	}

	if(keyDash and canDash and hasDash){
		canDash = 0;
		dashDirection = move;
		state = PLAYERSTATE.DASH;
	}



	//Animation


	//Listed in order of priority within if statements.

	

	image_angle = 0;
	if(hsp == 0 and move==0)
	{	
		sprite_index = sIdle;
		image_speed = 1;
	}
	else
	{             
		sprite_index = sWalk;
		image_speed = 1;
	}
	if(move != 0){
		image_xscale = sign(move);
	}
	else if(move == 0 and hsp != 0){
		image_xscale = sign(hsp);
	}

	if(keyAttack and touchingFloor and !inAttackSwingCooldown and hasSword){
		state = PLAYERSTATE.GROUND_ATTACK;
		if(keyUp){
			state = PLAYERSTATE.GROUND_UP_ATTACK;
		}
	}

}