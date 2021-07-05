// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function PlayerState_Dash(){
	image_speed = 1;
	
	if (sprite_index != sDash)
	{
		sprite_index = sDash;
		image_index = 0;
	}
	if(hsp != 0){
		image_xscale = sign(hsp);
	}
	hsp = dashSpeed*image_xscale;
	image_angle = 0;
	vsp = 0;
	x += hsp;
	if(animation_end()){
		state = PLAYERSTATE.FREE;
	}
}