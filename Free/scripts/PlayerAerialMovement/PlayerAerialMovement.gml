// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function PlayerAerialMovement(){
	if(animation_end(sJump)){
		sprite_index = sFall;
		image_speed = 1;
	}
	if(move!=0 and (sprite_index == sFall or sprite_index == sJump)){
		image_xscale = move;
	}
	if(touchingRoof){
		inJump = 0;
		show_debug_message("Touched Roof");
	}
	if(heightJumped >= 64*2 and inJump){
		if(!keyHoldJump){
			inJump = 0;
			vsp = -(((heightJumped)/maxJumpHeight))*5;
		}
		if(keyHoldJump and heightJumped < maxJumpHeight){
			vsp = -(((maxJumpHeight-heightJumped)/maxJumpHeight))*50-5;
		}
		if(keyHoldJump and heightJumped >= maxJumpHeight){
			inJump = 0;
		}
	}
	heightJumped -= vsp;
}