/// @description Insert description here
// You can write your code in this editor
polygon = polygon_from_instance(id);

if(place_meeting(x,y-1,oPlayer) or place_meeting(x+5,y,oPlayer) or place_meeting(x-5,y,oPlayer)){
	oPlayer.hspCarrySpeed = path_speed;
}
