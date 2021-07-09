// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function PlayerState_Dash(dashDirection){
	image_speed = 1;
	
	if (sprite_index != sDash)
	{
		sprite_index = sDash;
		image_index = 0;
	}
	
	if(dashDirection != 0){
		hsp = dashSpeed * dashDirection;
		image_xscale = sign(dashDirection);
	}
	else{
		hsp = dashSpeed*image_xscale;
	}
	
	vsp = 0;
	CollisionDetection();
	image_angle = 0;
	x += hsp;
	
	if(animation_end()){
		initDashDirection = 0;
		state = PLAYERSTATE.FREE;
	}
}