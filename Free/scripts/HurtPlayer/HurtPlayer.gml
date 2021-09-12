// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function HurtPlayer(_direction, _force, _damage){
	if(oPlayer.invulnerable <= 0){
		global.playerHP = max(0,global.playerHP - _damage);
		if(global.playerHP > 0){
			with(oPlayer){
				state = PLAYERSTATE.HIT;
				var _xKnockVal = lengthdir_x(_force, _direction)/2;
				var _yKnockVal = lengthdir_y(_force, _direction)/2;
				hsp = _xKnockVal;
				vsp = _yKnockVal;
				ScreenShake(5,10);
				flash = 0.7
				invulnerable = 60;
				attacksInARow = 0;
			}
		}
		else{
			with(oPlayer) {
				state = PLAYERSTATE.DEAD;
			}	
		}
	}
}