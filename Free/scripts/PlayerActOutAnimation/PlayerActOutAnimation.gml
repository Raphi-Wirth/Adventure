///@arg Sprite
///@arg EndScript
///@arg canMoveWhileAct
//Carry out an animation and optionally carry out a script when the animation ends
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function PlayerActOutAnimation(){
	state = PLAYERSTATE.ACT;
	actSprite = argument[0];
	image_index = 0;
	image_speed = 1;
	if(argument_count > 1){
		animationEndScript = argument[1];
	}
	if(argument_count > 2){
		canMoveWhileAct = argument[2];
	}
}