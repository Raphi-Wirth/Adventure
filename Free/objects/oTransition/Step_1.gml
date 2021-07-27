/// @description Insert description here
// You can write your code in this editor
if(instance_exists(oPlayer)){
	with(oPlayer) {
		state = PLAYERSTATE.TRANSITION;
		if(other.leading == IN){
			if(!touchingFloor and vsp != 0){
				hsp = 0;
				sprite_index = sFall;
				Gravity();
			}
			else{
				sprite_index = sWalk;
				image_speed = 1;
				hsp = maxSpeed * sign(image_xscale);
			}	
		}
	}
	if(leading == OUT){
		percent = min(1,percent + TRANSITION_SPEED);
		if(percent >= 1){
			room_goto(target);
			leading = IN;
		}
	}
	else { //leading == IN
		percent = max(0, percent - TRANSITION_SPEED);	
		//If screen is fully revealed, destroy this object
		oPlayer.hsp = 0;
		oPlayer.sprite_index = sIdle;
		if(percent <= 0){
			with (oPlayer) {
				state = PLAYERSTATE.FREE;
				
			}
			instance_destroy()
		}
	}
}