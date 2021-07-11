function PlayerState_Free(){
	//Movement mechanics


	//Horizontal Movement
	
	if(abs(hsp)<=1 and move == 0){ 
		hsp = move*walksp;
	}
	else if(abs(hsp)<=5 and move != 0){
		hsp += move*walksp;
	}
	else{
		hsp -= sign(hsp);
	}
	
	//This state uses gravity
	Gravity();
	CollisionDetection();
	
	
	
	if(touchingFloor){
		doubleJmp = 0;
		canDash = 1;
	}
	else if(!touchingFloor){
		state = PLAYERSTATE.IN_AIR;
	}
	
	//If not on the floor and not touching a wall, and you havent double jumped yet
	
	if(keyRight and !touchingFloor and touchingRWall and !collidingWall and vsp>0){
		if(instance_place(x+1,y-30,oWall)){
			state = PLAYERSTATE.WALL_GRAB;
			wallJumpDirection = -1;
		}
	}
	
	else if(keyLeft and !touchingFloor and touchingLWall and !collidingWall and vsp>0){
		if(instance_place(x-1,y-30,oWall)){
			state = PLAYERSTATE.WALL_GRAB;
			wallJumpDirection = 1;
		}
	}

	

	//Jump if on floor and not touching a wall
	if(touchingFloor and keyJump and (!(touchingRWall and wallJumpDirection) or !(touchingLWall and wallJumpDirection)))
	{
		vsp = -10;
		state = PLAYERSTATE.IN_AIR;

	}

	if(keyDash and canDash){
		canDash = 0;
		dashDirection = move;
		state = PLAYERSTATE.DASH;
	}


	
	x+=hsp;
	y+=vsp;

	//Animation


	//Listed in order of priority within if statements.
	image_speed = 1;
	

	image_angle = 0;
	if(hsp == 0 and move==0)
	{	
		sprite_index = sIdle;
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

	if(keyAttack and touchingFloor and !inAttackSwingCooldown){
		state = PLAYERSTATE.GROUND_ATTACK;
	}

}