// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function PlayerState_Wall_Grab(wallDirection){
	if(sprite_index != sWallGrab){
		sprite_index = sWallGrab;
		image_xscale = wallDirection;
		image_speed = 1;
	}
	vsp = wallGrabFallSpeed;
	
	if(keyJump){
		hsp = wallDirection * 10;
		vsp = -10;
		state = PLAYERSTATE.IN_AIR;
	}
	CollisionDetection();
	doubleJmp = 0;
	canDash = 1;
	
	if(keyDash and wallDirection == 1 and keyLeft){
		dashDirection = wallDirection;
		state = PLAYERSTATE.DASH;
	}
	else if (keyDash and wallDirection == -1 and keyRight){
		dashDirection = wallDirection;
		state = PLAYERSTATE.DASH;
	}
	if(!((keyRight and wallDirection == -1) or (keyLeft and wallDirection == 1))){
		if(touchingFloor){
			show_debug_message("Touching Floor");
			state = PLAYERSTATE.FREE;
		}
		else{
			state = PLAYERSTATE.IN_AIR;
		}
		
	}
	
	if(touchingFloor and !collidingWall){
		state = PLAYERSTATE.FREE;
	}
	
	if(keyRight){
		var wall = instance_place(x+1,y,all);
		if(!wall or wall.wallGrabbable != 1){

			state = PLAYERSTATE.IN_AIR;
		}
	}
	
	else if (keyLeft) {
		var wall = instance_place(x-1,y,all);
		if(!wall or wall.wallGrabbable != 1){
			state = PLAYERSTATE.IN_AIR;
		}
	}
	
}