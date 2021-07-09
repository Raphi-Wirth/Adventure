//Get player input
keyLeft = keyboard_check(vk_left);
keyRight = keyboard_check(vk_right);
keyJump = keyboard_check_pressed(vk_space);
keyDash = keyboard_check_pressed(ord("C"));
keyDown = keyboard_check(vk_down);
keyAttack = keyboard_check(ord("X"));


move = keyRight - keyLeft;



if(keyDown and vsp>0){
	fastFall = 1;
}
else{
	grv = 0.5;
	fastFall = 0;
}
if(fastFall = 1){
	grv = 1.5;
}

switch (state)
{
	case PLAYERSTATE.FREE: PlayerState_Free(); break;
	
	case PLAYERSTATE.DASH: PlayerState_Dash(dashDirection); break;
		
	case PLAYERSTATE.GROUND_ATTACK: PlayerState_Ground_Attack(); break;
	
	case PLAYERSTATE.WALL_GRAB: PlayerState_Wall_Grab(wallJumpDirection); break;
	
	case PLAYERSTATE.DOUBLE_JUMP: PlayerState_Double_Jump(jumpDirection); break;
	
	case PLAYERSTATE.IN_AIR: PlayerState_In_Air(); break;
	
	case PLAYERSTATE.AIR_ATTACK: PlayerState_Air_Attack(); break;
	
}