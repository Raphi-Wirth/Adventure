//Get player input
keyLeft = keyboard_check(vk_left);
keyRight = keyboard_check(vk_right);
keyJump = keyboard_check_pressed(vk_space);

//Calculate movement 
var move = keyRight - keyLeft;

hsp = move*walksp

vsp = vsp+grv;
//Double Jump

if(!place_meeting(x,y+1,oWall) and keyJump and doubleJmp == 0){
	vsp = -10;
	doubleJmp = 1; 
	if(hsp>0){
		flipRight = 1;
	}
	else if(hsp<0){
		flipLeft = 1;
	}
	else{
		flipLeft = 0;
		flipRight = 0;
	}
}

//Jump
if(place_meeting(x,y+1,oWall) and keyJump)
{
	vsp = -10;
}


//Horizontal Collision
if(place_meeting(x+hsp,y,oWall))
{
	while(!place_meeting(x+sign(hsp),y,oWall))
		{
			x += sign(hsp);
		}
	hsp = 0;
	if(keyRight){
		holdingRight = 1;
	}
	else if (keyLeft){
		holdingLeft = 1;
	}
}
else{
	holdingRight = 0;
	holdingLeft = 0;
}

x = x + hsp;

//Vertical Collision
if(place_meeting(x,y+vsp,oWall)){
	while(!place_meeting(x,y+sign(vsp),oWall))
	{
		y += sign(vsp);
	}
	vsp = 0;
}
if(holdingRight or holdingLeft){
	vsp = 0.3;
}
y = y + vsp;


//Animation



if(place_meeting(x+1,y,oWall)){
	if(keyLeft){
		sprite_index = sWallGrab;
		image_xscale = 1;
	}
	else if(keyRight){
		sprite_index = sWallGrab;
		image_xscale = -1;
	}
}

else if(!place_meeting(x,y+1,oWall))
{
	if(vsp<=0){
		sprite_index = sJump;
	}
	else{
		sprite_index = sFall;
	} 
	if(flipRight and image_angle <360){
		image_angle += 20;
	}
	else if(flipLeft and image_angle > -360){
		image_angle -= 20;
	}
}
else
{
	doubleJmp = 0;
	flipRight = 0;
	flipLeft = 0;
	image_angle = 0;
	if(hsp == 0)
	{
		sprite_index = sIdle;
	}
	else
	{             
		sprite_index = sWalk;
		image_xscale = sign(hsp)
	}
}


