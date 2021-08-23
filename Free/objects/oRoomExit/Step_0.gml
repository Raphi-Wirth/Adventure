/// @description Cause room transition
// You can write your code in this editor
if(instance_exists(oPlayer)) and (position_meeting(oPlayer.x, oPlayer.y, id)){
	if(!instance_exists(oTransition) and oPlayer.state != PLAYERSTATE.DEAD){
		global.targetRoom = targetRoom;
		global.targetX = targetX;
		global.targetY = targetY;
		global.targetDirection = oPlayer.image_xscale;
		with (oPlayer) {
			state = PLAYERSTATE.TRANSITION;
		}
		RoomTransition(TRANS_TYPE.SLIDE, targetRoom);
		instance_destroy();
	}

}