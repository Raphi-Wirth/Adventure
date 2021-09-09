/// @description Insert description here
// You can write your code in this editor
Gravity();
savedHsp = hsp;
if(EnemyTileCollision() and !hasSpawnedRocks){
	hasSpawnedRocks = 1;
	with(instance_create_layer(x-sign(hsp), min(oPlayer.y + random_range(25,120), room_height-50), "Instances", oRock)){
		image_index = choose(0,1,2);
		image_speed = 0;
		grv = 0;
		hsp = -other.savedHsp/1.25;
	}
	hsp = 0;
	vsp = 0;
	grv = 0;
}