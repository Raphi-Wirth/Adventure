// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function EntityHitSolid(){
	flash = 0.75;
	currentHP--;
	if(currentHP<=0){
		part_particles_create(global.partSystem, x, y, global.ptWallGrab, 1);
		instance_destroy();
	}
}