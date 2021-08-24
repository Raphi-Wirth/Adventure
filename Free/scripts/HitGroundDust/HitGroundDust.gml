// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function HitGroundDust(){
	part_type_speed(global.ptJumpLandLeft,0.5,min(2 + abs(oPlayer.hsp),3.5),-0.025,0);
	part_type_speed(global.ptJumpLandRight,0.5 ,min(2 + abs(oPlayer.hsp),3.5),-0.025,0);
	if(hsp>=maxSpeed/1.25){
		part_particles_create(global.partSystem, x, y, global.ptJumpLandRight, irandom_range(8,14));
	}
	else if(hsp<=-maxSpeed/1.25){
		part_particles_create(global.partSystem, x, y, global.ptJumpLandLeft, irandom_range(8,14));
	}
	else{
		part_particles_create(global.partSystem, x, y, global.ptJumpLandRight, irandom_range(5,10));
		part_particles_create(global.partSystem, x, y, global.ptJumpLandLeft, irandom_range(5,10));
	}
	
	
}