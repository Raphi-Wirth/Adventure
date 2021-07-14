// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function PlayerGainsHealth(){
	
	var _healing = argument0;
	var _originalHP = currentHP;
	currentHP += _healing;
	if (currentHP > maxHP) {
		currentHP = maxHP;
	}
	show_debug_message("Received healing. Now on hp:");
	show_debug_message(currentHP);
}