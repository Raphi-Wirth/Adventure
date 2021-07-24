/// @description Insert description here
// You can write your code in this editor
polygon = polygon_from_instance(id);
/*if(place_meeting(x,y,oWall)){
	path_speed = -path_speed;
}*/
if(place_meeting(x,y-1,oPlayer) or place_meeting(x+5,y,oPlayer) or place_meeting(x-5,y,oPlayer)){
	oPlayer.hspCarrySpeed = path_speed;
}

if(place_meeting(x,y,oPlayer)){
	var dir = oPlayer.x - x
	while(place_meeting(x+path_speed,y,oPlayer)){
		oPlayer.x += sign(dir);
	}
}
