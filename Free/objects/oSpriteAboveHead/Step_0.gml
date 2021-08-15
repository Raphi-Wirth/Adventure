/// @description Insert description here
// You can write your code in this editor
timer ++; 
if(abs(timer - 0) <= 50){
	imageAlphaDecrease = abs(timer)/50
}
else if(abs(timer - duration) <= 50){
	imageAlphaDecrease = abs(timer-duration)/50
}
if(timer >= duration){
	instance_destroy();
}
