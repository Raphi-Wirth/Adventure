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
			oPlayer.sprite_index = sIdle;
			if(global.targetDirection != 0){
				oPlayer.image_xscale = global.targetDirection;
			}
			oPlayer.invulnerable = 0;
			global.iCamera.x = oPlayer.x;
			global.iCamera.y = oPlayer.y;
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