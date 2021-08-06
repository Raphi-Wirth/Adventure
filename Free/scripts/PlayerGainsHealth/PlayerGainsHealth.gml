// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function PlayerGainsHealth(){
	
	var _healing = argument0;
	var _originalHP = playerHP;
	playerHP += _healing;
	if (playerHP > maxHP) {
		playerHP = maxHP;
	}
	show_debug_message("Received healing. Now on hp:");
	show_debug_message(playerHP);
}