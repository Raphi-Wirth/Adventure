// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function HitGroundDust(){
	part_type_speed(global.ptJumpLandLeft,0.5,min(2.5 + abs(oPlayer.hsp),4),-0.025,0);
	part_type_speed(global.ptJumpLandRight,0.5 ,min(2.5 + abs(oPlayer.hsp),4),-0.025,0);
	if(hsp>=maxSpeed){
		part_particles_create(global.partSystem, x, y, global.ptJumpLandRight, irandom_range(6,10));
		part_particles_create(global.partSystem, x, y, global.ptJumpLandLeft, 2);
	}
	else if(hsp<=-maxSpeed){
		part_particles_create(global.partSystem, x, y, global.ptJumpLandLeft, irandom_range(6,10));
		part_particles_create(global.partSystem, x, y, global.ptJumpLandRight, 2);
	}
	else{
		part_particles_create(global.partSystem, x, y, global.ptJumpLandRight, irandom_range(2,5));
		part_particles_create(global.partSystem, x, y, global.ptJumpLandLeft, irandom_range(2,5));
	}
	
	
}