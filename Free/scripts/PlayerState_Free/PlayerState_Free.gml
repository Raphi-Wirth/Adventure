function PlayerState_Free(){
	var touchingFloor = instance_place(x,y+1,oWall);
	var touchingLWall = instance_place(x-1,y,oWall);
	var touchingRWall = instance_place(x+1,y,oWall);
	var collidingWall = instance_place(x,y,oWall)


	//Movement mechanics

	//Checks if flip should still be active
	if(flipCountTimer == 17){
		flipActive = 0;
	}
	else{
		flipCountTimer += 1;	
	}


	//Checks if dash should still be active
	{
		if(abs(hsp)<=1 and move == 0){ 
			hsp = move*walksp;
		}
		else if(abs(hsp)<=5 and move != 0){
			hsp += move*walksp;
		}
		else{
			hsp -= 0.4*sign(hsp);
		}
	}

	vsp = vsp+grv;

	//Checks if currently in wall and moves player away via a vector between
	//oWall centre and player centre
	if(collidingWall != 0){
		while(instance_place(x,y,collidingWall)){
			xDiff = collidingWall.x - x;
			yDiff = collidingWall.y - y;
			len = sqrt(sqr(xDiff) + sqr(yDiff));
			moveX = xDiff/len;
			moveY = yDiff/len;
			x -= moveX;
			y -= moveY;
		}
	}


	if(!touchingFloor and keyJump and doubleJmp == 0 and !(touchingRWall or touchingLWall)){
		vsp = -10;
		doubleJmp = 1; 
		if(move>0){
			flipRight = 1;
			flipCountTimer = 0;
			flipActive = 1;
		}
		else if(move<0){
			flipLeft = 1;
			flipCountTimer = 0;
			flipActive = 1;
		}
		else{
			flipLeft = 0;
			flipRight = 0;
		}
	}

	//Jump
	if(touchingFloor and keyJump and !(touchingRWall or touchingLWall))
	{
		vsp = -10;
	}

	if(keyDash and canDash){
		canDash = 0;
		state = PLAYERSTATE.DASH;
	}


	//Horizontal Collision

	if(place_meeting(x + hsp, y, oWall))
	{
	
		while(!place_meeting(x + sign(hsp), y, oWall))
			{
				x += sign(hsp);
			}
		hsp = 0;
		if(keyRight and !touchingFloor and touchingRWall and !collidingWall){
			image_angle = 0;
			holdingRight = 1;
			canDash = 1;
		}
		else if(keyLeft and !touchingFloor and touchingLWall and !collidingWall){
			image_angle = 0;
			holdingLeft = 1;
			canDash = 1;
		}
	}
	else{
		holdingLeft = 0;
		holdingRight = 0;
	}
	x = x + hsp;

	if((holdingLeft or holdingRight)){
		vsp = wallGrabFallSpeed;
	}

	if(holdingRight and keyJump){
		hsp = -10;
		vsp = -10;
	}
	else if(holdingLeft and keyJump){
		hsp = 10;
		vsp = -10;
	}


	//Vertical Collision

	else if(place_meeting(x,y+vsp,oWall)){
		while(!place_meeting(x,y+sign(vsp),oWall))
		{	
		
			y += sign(vsp);
		}
		vsp = 0;
		flipActive = 0;
		canDash = 1;
		doubleJmp = 0;
		flipRight = 0;
		flipLeft = 0;
	}
 
	y = y + vsp;


	//Animation


	//Listed in order of priority within if statements.
	image_speed = 1;
	if(!touchingFloor)
	{
		if(vsp<=0){
			sprite_index = sJump;
		}
		else{
			sprite_index = sFall;
		} 
	
		if(flipRight and flipActive){
			image_angle -= 40;
		}
		else if(flipLeft and flipActive){
			image_angle += 40;
		}
		//Resets angle in case something fucky goes on and not flipping
		else if(!flipActive){
			image_angle = 0;
		}
	}
	else
	{
		image_angle = 0;
		if(hsp == 0)
		{	
			/*if (keyDown){
				image_yscale *= 0.5;
			}*/
			sprite_index = sIdle;
		}
		else
		{             
			sprite_index = sWalk;
			image_speed = abs(hsp)/2.5;
		}
	}
	if(move != 0){
		image_xscale = sign(move);
	}
	else if(move == 0 and hsp != 0){
		image_xscale = sign(hsp);
	}

	if(touchingLWall or touchingRWall){
		if(keyLeft){
			sprite_index = sWallGrab;
			image_xscale = 1;
		}
		else if(keyRight){
			sprite_index = sWallGrab;
			image_xscale = -1;
		}
	}
	if(keyAttack){
		state = PLAYERSTATE.ATTACK_SLASH;
	}
}

