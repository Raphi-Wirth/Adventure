// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function NewGame(){
	global.gameSaveSlot = argument0;
	global.playerHP = 5;
	global.playerMaxHP = 5;
	global.targetX = 488;
	global.targetY = 2687
	global.hasSword =  1;
	global.hasDash = 0;
	global.hasDoubleJump = 0;
	global.hasWallGrab = 0;
	RoomTransition(TRANS_TYPE.SLIDE, rTutorialTestR1);
}