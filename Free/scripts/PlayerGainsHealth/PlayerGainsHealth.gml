// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
///@arg Healing
function PlayerGainsHealth(){
	
	var _healing = argument0;
	var _originalHP = global.playerHP;
	global.playerHP += _healing;
	if (global.playerHP > global.playerMaxHP) {
		global.playerHP = global.playerMaxHP;
	}
}