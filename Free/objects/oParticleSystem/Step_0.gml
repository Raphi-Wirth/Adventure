/// @description Insert description here
// You can write your code in this editor
if (oPlayer and oPlayer.state == PLAYERSTATE.WALL_GRAB){
	part_particles_create(global.partSystem, oPlayer.x - oPlayer.wallJumpDirection*6, oPlayer.y+20, global.ptWallGrab, 1);
}
if (oPlayer and oPlayer.state == PLAYERSTATE.DASH){
	part_particles_create(global.partSystem, oPlayer.x - oPlayer.initDashDirection*10, oPlayer.y, global.ptBasic, 1);
}