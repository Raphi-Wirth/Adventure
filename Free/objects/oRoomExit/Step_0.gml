/// @description Cause room transition
// You can write your code in this editor
if(instance_exists(oPlayer)) and (position_meeting(oPlayer.x, oPlayer.y, oRoomExit)){
	global.targetRoom = targetRoom;
	global.targetX = targetX;
	global.targetY = targetY;
	global.targetDirection = oPlayer.direction;
	room_goto(targetRoom);
	instance_destroy();
}