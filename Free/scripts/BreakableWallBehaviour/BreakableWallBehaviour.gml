// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function BreakableWallBehaviour(){
	hp--;
	rumble = 15;
	DropItems(x, y, array_create(10, oFragPlant), 5, 0);
	if(hp == 0){
		instance_destroy();
	}
}