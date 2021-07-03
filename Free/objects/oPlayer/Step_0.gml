//Get player input
keyLeft = keyboard_check(vk_left);
keyRight = keyboard_check(vk_right);
keyJump = keyboard_check_pressed(vk_space);
keyDash = keyboard_check_pressed(ord("C"));
keyDown = keyboard_check(vk_down);

//Get collission
var touchingFloor = instance_place(x,y+1,oWall);
var touchingLWall = instance_place(x-1,y,oWall);
var touchingRWall = instance_place(x+1,y,oWall);
var collidingWall = instance_place(x,y,oWall)

//Calculate movement 
var move = keyRight - keyLeft;

//Movement mechanics
if(dashActive == 1 and dashCountTimer < 10){
	hsp = hsp;
	dashCountTimer += 1
	vsp -= grv;
}
else if(dashCountTimer == 10 and dashActive  == 1 and touchingFloor){
	dashActive = 0;
	dashCountTimer = 0;
}
else{
	if(abs(hsp)<=1 and move == 0){ 
		hsp = move*walksp;
	}
	else if(abs(hsp)<=5 and move != 0){
		hsp += move*walksp;
	}
	else{
		hsp -= 0.5*sign(hsp);
	}
}

vsp = vsp+grv;

//Restart player position

if(keyboard_check_pressed(ord("R"))){
	x = xstart;
	y = ystart;
}

//Checks if currently in wall and moves player away via a vector between
//oWall centre and player centre

if(collidingWall != 0){
	while(instance_place(x,y,collidingWall)){
		xDiff = collidingWall.x - x;
		yDiff = collidingWall.y - y;
		len = sqrt(sqr(xDiff) + sqr(yDiff));
		moveX = xDiff/len;
		moveY = yDiff/len;
		show_debug_message(collidingWall.y);
		show_debug_message(y);
		show_debug_message(moveY);
		x -= moveX;
		y -= moveY;
	}
}


if(!touchingFloor and keyJump and doubleJmp == 0 and !(touchingRWall or touchingLWall)){
	vsp = -10;
	doubleJmp = 1; 
	if(move>0){
		flipRight = 1;
	}
	else if(move<0){
		flipLeft = 1;
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

if(keyDash and dashCountTimer == 0){
	hsp = 10*image_xscale;
	image_angle = 0;
	dashActive = 1;
	vsp = 0;
}


//Horizontal Collision

if(place_meeting(x + hsp, y, oWall))
{
	
	while(!place_meeting(x + sign(hsp), y, oWall))
		{
			x += sign(hsp);
		}
	hsp = 0;
	if(keyRight and !touchingFloor and touchingRWall){
		holdingRight = 1;
		dashActive = 0;
		dashCountTimer = 0;
	}
	else if (keyLeft and !touchingFloor and touchingLWall){
		holdingLeft = 1;
		dashActive = 0;
		dashCountTimer = 0;
	}
}
else{
	holdingLeft = 0;
	holdingRight = 0;
}
x = x + hsp;

if((holdingLeft or holdingRight)){
	vsp = 0.3;
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
}
 
y = y + vsp;


//Animation
if(dashActive == 1){
	sprite_index = sDash;
	image_xscale = sign(hsp);
}
else if(!touchingFloor)
{
	if(vsp<=0){
		sprite_index = sJump;
	}
	else{
		sprite_index = sFall;
	} 
	
	if(flipRight and image_angle > -360){
		image_angle -= 20;
	}
	else if(flipLeft and image_angle < 360){
		image_angle += 20;
	}
}
else
{
	doubleJmp = 0;
	flipRight = 0;
	dashActive = 0;
	flipLeft = 0;
	image_angle = 0;
	if(hsp == 0)
	{	
		/*if(keyDown){
			image_yscale*=0.5;
		}*/
		sprite_index = sIdle;
	}
	else
	{             
		sprite_index = sWalk;
	}
}
if(move != 0){
	image_xscale = sign(move);
}
else if(move == 0 and hsp != 0){
	image_xscale = sign(hsp);
}
else{
	image_xscale = 1;
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



