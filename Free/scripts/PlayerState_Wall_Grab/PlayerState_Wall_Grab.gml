// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function PlayerState_Wall_Grab(wallDirection){
	if(sprite_index != sWallGrab){
		sprite_index = sWallGrab;
		image_xscale = wallDirection;
		image_speed = 1;
	}
	hsp = 0;
	vsp = wallGrabFallSpeed;
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
		state = PLAYERSTATE.FREE;
	}
	if(keyJump){
		hsp = wallDirection * 8;
		vsp = -10;
		state = PLAYERSTATE.FREE;
	}
	if(touchingFloor and !collidingWall){
		state = PLAYERSTATE.FREE
	}
	if(keyRight){
		if(!instance_place(x+1,y+20,oWall)){
			state = PLAYERSTATE.FREE;
		}
	}
	
	else if (keyLeft) {
		if(!instance_place(x-1,y+20,oWall)){
			state = PLAYERSTATE.FREE
		}
	}
	
	x+=hsp;
	y+=vsp;
	
}