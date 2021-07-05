//Get player input
keyLeft = keyboard_check(vk_left);
keyRight = keyboard_check(vk_right);
keyJump = keyboard_check_pressed(vk_space);
keyDash = keyboard_check_pressed(ord("C"));
keyDown = keyboard_check(vk_down);
keyAttack = keyboard_check(ord("X"));
move = keyRight - keyLeft;

switch (state)
{
	case PLAYERSTATE.FREE: PlayerState_Free(); break;
	
	case PLAYERSTATE.DASH: PlayerState_Dash(move); break;
		/*if(move == 0){
			var dashDirection = image_xscale;
		}*/
		
		
	case PLAYERSTATE.GROUND_ATTACK: PlayerState_Ground_Attack(); break;
	
	
	
}