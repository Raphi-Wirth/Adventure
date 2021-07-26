// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information

///@arg Magnitude
///@Arg Frames
function ScreenShake(){
	with (oCamera) {
		if(argument0 > shakeRemain){
			shakeMagnitude = argument0;
			shakeRemain = shakeMagnitude;
			shakeLength = argument1;
		}
	}
}