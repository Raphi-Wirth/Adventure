// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function PlayerTakesDamage(){
	
	var _damage = argument0;
	playerHP -= _damage;
	show_debug_message("Received damage. Now on hp:");
	show_debug_message(playerHP);
}