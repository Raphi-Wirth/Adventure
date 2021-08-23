/// @description Insert description here
// You can write your code in this editor
if(instance_exists(oPlayer)){
	with(oPlayer) {
		if(state != PLAYERSTATE.DEAD) state = PLAYERSTATE.TRANSITION;
		if(other.leading == OUT){
			if(!touchingFloor and (x>0 and x<room_width)){
				sprite_index = sFall;
				Gravity();
			}
			else if(other.playerMoves == true){
				vsp = 0;
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
else{
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
		if(percent <= 0){
			instance_destroy()
		}
	}
}