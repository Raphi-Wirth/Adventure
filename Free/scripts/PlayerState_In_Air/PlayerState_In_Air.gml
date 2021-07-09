// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function PlayerState_In_Air(){
	if(move!=0){
		image_xscale = move;
	}
	if(abs(hsp)<=1 and move == 0){ 
		hsp = move*walksp;
	}
	else if(abs(hsp)<=5 and move != 0){
		hsp += move*walksp;
	}
	else{
		hsp -= 0.4*sign(hsp);
	}
	
	Gravity();
	CollisionDetection();
	
	if(keyDash and canDash){
		canDash = 0;
		dashDirection = move;
		state = PLAYERSTATE.DASH;
	}
	
	if(keyRight and !touchingFloor and touchingRWall and !collidingWall and vsp>0){
		if(instance_place(x+1,y-20,oWall)){
			state = PLAYERSTATE.WALL_GRAB;
			wallJumpDirection = -1;
		}
	}
	
	else if(keyLeft and !touchingFloor and touchingLWall and !collidingWall and vsp>0){
		if(instance_place(x-1,y-20,oWall)){
			state = PLAYERSTATE.WALL_GRAB;
			wallJumpDirection = 1;
		}
	}
	
	if(!touchingFloor and keyJump and doubleJmp == 0 and !(touchingRWall or touchingLWall)){
		jumpDirection = move;
		state = PLAYERSTATE.DOUBLE_JUMP;
	}
	
	if(keyAttack){
		state = PLAYERSTATE.AIR_ATTACK
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

	if(vsp>= 0){
		if (vsp >= 0 and vsp < 2){
			sprite_index = sFall;
			image_index = 0;
		}
		else if (vsp >= 2){
			sprite_index = sFall;
			image_index = 1;
		}
	}
	if(touchingFloor){
		state = PLAYERSTATE.FREE;
	}
	x+=hsp;
	y+=vsp;
		
}