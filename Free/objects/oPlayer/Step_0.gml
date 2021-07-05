//Get player input
keyLeft = keyboard_check(vk_left);
keyRight = keyboard_check(vk_right);
keyJump = keyboard_check_pressed(vk_space);
keyDash = keyboard_check_pressed(ord("C"));
keyDown = keyboard_check(vk_down);
keyAttack = keyboard_check(ord("X"));

switch (state)
{
	case PLAYERSTATE.FREE: PlayerState_Free(); break;
		
	case PLAYERSTATE.ATTACK_SLASH: PlayerState_Attack_Slash(); break;
	
	case PLAYERSTATE.ATTACK_COMBO: PlayerState_Attack_Combo(); break;
	
	
}