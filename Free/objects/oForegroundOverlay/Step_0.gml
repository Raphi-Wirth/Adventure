/// @description Insert description here
// You can write your code in this editor
if(instance_exists(oPlayer) and oPlayer.x > x + room_width/2){
	image_alpha = min((oPlayer.x - room_width/2)/room_width, maxAlpha);
}
else{
	image_alpha = 0;
}