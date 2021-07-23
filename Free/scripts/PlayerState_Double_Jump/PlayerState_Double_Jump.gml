// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function PlayerState_Double_Jump(){
	vsp = -jumpHeight;
	PlayerHorizontalMovement();
	CollisionDetection();
	doubleJmp = 1;
	state = PLAYERSTATE.IN_AIR;
}