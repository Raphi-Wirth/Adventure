//Get player input
keyLeft = keyboard_check(vk_left);
keyRight = keyboard_check(vk_right);
keyJump = keyboard_check(vk_space);

//Calculate movement
var move = keyRight - keyLeft;

hsp = move*walksp

vsp = vsp+grv;

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
}

x = x + hsp;

//Vertical Collision
if(place_meeting(x,y+vsp,oWall)){
	while(!place_meeting(y+sign(vsp),y,oWall))
	{
		y += sign(vsp);
	}
	vsp = 0;
}
y = y + vsp;



