/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event
event_inherited();
if(rumble != 0){
	var _randomX = irandom_range(-15,15);
	var _randomY = irandom_range(-2,2);
	draw_sprite_ext(sprite_index, image_index, x+_randomX,y+_randomY, image_xscale, image_yscale,image_angle,c_white,1);
}
 