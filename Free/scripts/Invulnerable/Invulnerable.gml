// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function Invulnerable(){
	flashAlpha -= 0.05;
	if(flashAlpha == 0 and invulnerableTicks > 0){
		flashAlpha = 1;
		invulnerableTicks -= 1;
	}
	else if (flashAlpha == 0 and invulnerableTicks == 0){
		invulnerable = 0;
		invulnerableTicks = 2;
	}
}