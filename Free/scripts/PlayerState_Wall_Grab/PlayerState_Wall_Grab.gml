// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function PlayerState_Wall_Grab(){
	if(sprite_index != sWallGrab){
		sprite_index = sWallGrab;
		image_speed = 1;
	}
	vsp = wallGrabFallSpeed;
	CollisionDetection();
	if(touchingRWall){
		image_xscale = -1;
	}
	else{
		image_xscale = 1;
	}
	if(keyJump){
		hsp = image_xscale * 10;
		vsp = -jumpHeight;
		state = PLAYERSTATE.IN_AIR;
	}
	doubleJmp = 0;
	canDash = 1;
	if(hasDash){
		if(keyDash and image_xscale == 1 and keyLeft){
			dashDirection = image_xscale;
			state = PLAYERSTATE.DASH;
		}
		else if (keyDash and image_xscale == -1 and keyRight){
			dashDirection = image_xscale;
			state = PLAYERSTATE.DASH;
		}
	}

	if(!((keyRight and image_xscale == -1) or (keyLeft and image_xscale == 1))){
		if(touchingFloor){
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
		var wall = instance_place(x+1,y,oWall);
		if(!wall or wall.wallGrabbable != 1){
			state = PLAYERSTATE.IN_AIR;
		}
	}
	
	else if (keyLeft) {
		var wall = instance_place(x-1,y,oWall);
		if(!wall or wall.wallGrabbable != 1){
			state = PLAYERSTATE.IN_AIR;
		}
	}
	
}