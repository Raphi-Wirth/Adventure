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
	if(hsp != 0)
	{
		while(!place_meeting(x+sign(hsp),y,oWall))
		{
			x += sign(hsp);
		}
	}
	hsp = 0;
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
y = y + vsp;

//Animation
if(!place_meeting(x,y+1,oWall))
{
	if(vsp<=0){
		sprite_index = sJump;
	}
	else{
		sprite_index = sFall;
	} 
}
else
{
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


