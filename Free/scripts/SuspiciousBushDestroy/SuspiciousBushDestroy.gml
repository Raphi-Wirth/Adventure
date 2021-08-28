// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function SuspiciousBushDestroy(){
	switch (spawnsEnemy){
		case 0: instance_destroy(); break;
		case 1: instance_create_layer(x,y-1,"Instances", oLeaflet); instance_destroy(); break;
	}
}