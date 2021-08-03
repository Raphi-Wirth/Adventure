/// @description Cause room transition
// You can write your code in this editor
if(instance_exists(oPlayer)) and (position_meeting(oPlayer.x, oPlayer.y, id)){
	if(!instance_exists(oTransition)){
		global.targetRoom = targetRoom;
		show_debug_message(global.targetRoom);
		global.targetX = targetX;
		global.targetY = targetY;
		global.targetDirection = oPlayer.image_xscale;
		global.currentHP = oPlayer.currentHP;
		with (oPlayer) {
			state = PLAYERSTATE.TRANSITION;
		}
		RoomTransition(TRANS_TYPE.SLIDE, targetRoom);
		instance_destroy();
	}

}