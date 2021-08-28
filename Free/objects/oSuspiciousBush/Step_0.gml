/// @description Insert description here
// You can write your code in this editor
if(spawnsEnemy == 1){
	if(point_distance(x,y,oPlayer.x,oPlayer.y)<=150){
		 instance_create_layer(x,y-1,"Instances", oLeaflet); 
		 instance_destroy();
	}
}