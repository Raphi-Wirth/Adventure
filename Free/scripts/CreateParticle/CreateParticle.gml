// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function CreateParticle(x,y,type){
	part_particles_create(global.partSystem, x, y+5, type, 1);
}