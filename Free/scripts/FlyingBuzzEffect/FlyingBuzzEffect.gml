// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function FlyingBuzzEffect(intensity){
	hsp = random_range(intensity,-intensity);
	vsp = random_range(intensity,-intensity);
	CollisionDetection();
}