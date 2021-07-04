// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function PlayerState_Free(){

//Get collission
var touchingFloor = instance_place(x,y+1,oWall);
var touchingLWall = instance_place(x-1,y,oWall);
var touchingRWall = instance_place(x+1,y,oWall);
var collidingWall = instance_place(x,y,oWall)

//Calculate movement 
var move = keyRight - keyLeft;
show_debug_message(dashActive);
show_debug_message(dashCountTimer);
//Movement mechanics

//Checks if flip should still be active
if(flipCountTimer == 17){
	flipActive = 0;
}
else{
	flipCountTimer += 1;	
}


//Checks if dash should still be active
if(dashCountTimer == 10){
	dashActive = 0;
}
else{
	dashCountTimer += 1;
}


if(dashActive == 1){
	hsp = hsp;
	vsp -= grv;
}

else{
	if(abs(hsp)<=1 and move == 0){ 
		hsp = move*walksp;
	}
	else if(sign(hsp) != move){
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
with collidingWall{
	if(collidingWall != 0){
		xDiff = collidingWall.x - x;
		yDiff = collidingWall.y - y;
		len = sqrt(sqr(xDiff) + sqr(yDiff));
		moveX = xDiff/len;
		moveY = yDiff/len;
		x -= moveX;
		y -= moveY;
		while(instance_place(x + sign(xDiff), y + sign(yDiff),collidingWall)){
			x -= moveX;
			y -= moveY;
			xDiff = collidingWall.x - x;
			yDiff = collidingWall.y - y;
			len = sqrt(sqr(xDiff) + sqr(yDiff));
			moveX = xDiff/len;
			moveY = yDiff/len;
		}
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

if(keyDash and canDash == 1){
	hsp = 10*image_xscale;
	image_angle = 0;
	dashActive = 1;

}