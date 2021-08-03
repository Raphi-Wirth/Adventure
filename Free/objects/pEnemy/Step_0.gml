/// @description Insert description here
// You can write your code in this editor

if(!global.gamePaused){
	if(enemyScript[state] != -1){
		script_execute(enemyScript[state]);
		depth = -bbox_bottom;
	}
	show_debug_message(xTo);
	show_debug_message(yTo); 
}