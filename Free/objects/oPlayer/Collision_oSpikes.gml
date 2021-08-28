/// @description Insert description here
// You can write your code in this editor
if(!invulnerable){
	if(y-other.y>0){
		HurtPlayer(270, 30, 1);
	}
	else{
		HurtPlayer(90, 30, 1);
	}
	instance_create_layer(x,y,"Instances", oTransitionToCheckpoint)
}
