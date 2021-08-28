/// @description Insert description here
// You can write your code in this editor
if(instance_exists(oPlayer)){
	with(oPlayer) {
		if(state != PLAYERSTATE.DEAD) state = PLAYERSTATE.TRANSITION; oPlayer.hsp = 0; oPlayer.vsp = 0;
	}
	if(leading == OUT){
		percent = min(1,percent + TRANSITION_SPEED);
		if(percent >= 1){
			oPlayer.x = global.targetX;
			oPlayer.y = global.targetY;

			leading = IN;
		}
	}
	else { //leading == IN
		percent = max(0, percent - TRANSITION_SPEED);
		//If screen is fully revealed, destroy this object
		oPlayer.sprite_index = sIdle;
		if(percent <= 0){
			with (oPlayer) {
				state = PLAYERSTATE.FREE; 
			}
			instance_destroy()
		}
	}
}