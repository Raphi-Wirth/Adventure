/// @description Insert description here
// You can write your code in this editor
if(duration != 0){
	timer ++; 
	if(abs(timer - 0) <= 50){
		imageAlpha = abs(timer)/50
	}
	else if(abs(timer - duration) <= 50){
		imageAlpha = abs(timer-duration)/50
	}
	if(timer >= duration){
		instance_destroy();
	}
}
else if(!fading){
	imageAlpha = min(imageAlpha + 1/50, 1)
	if(abs(point_distance(x,y,oPlayer.x,oPlayer.y))>=fadeDistance*1.5 and imageAlpha >= 1){
		fading = true;
	}
}
else{
	imageAlpha = max(imageAlpha - 1/50, 0);
	if(imageAlpha == 0){
		instance_destroy();
	}
}
