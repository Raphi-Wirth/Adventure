/// @description Insert description here
// You can write your code in this editor
if(instance_exists(oPlayer)){
	with(oPlayer) {
		state = PLAYERSTATE.TRANSITION;
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
		if(percent <= 0){
			with (oPlayer) {
				state = PLAYERSTATE.FREE;
			}

			instance_destroy()
		}
	}
}