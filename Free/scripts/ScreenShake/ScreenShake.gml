// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information

///@arg Magnitude
///@arg Frames
function ScreenShake(){
	with (global.iCamera) {
		if(argument0 > shakeRemain){
			shakeMagnitude = argument0;
			shakeRemain = shakeMagnitude;
			shakeLength = argument1;
		}
	}
}