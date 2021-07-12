// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function CreateHealthbar(){
	for(var i = 0; i<5; i++){
		instance_create_layer(oCamera.x, oCamera.y, "Player", oHealthBar);
	}
}