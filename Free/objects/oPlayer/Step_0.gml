//Get player input
keyLeft = keyboard_check(vk_left);
keyRight = keyboard_check(vk_right);
keyJump = keyboard_check_pressed(vk_space);
keyDash = keyboard_check_pressed(ord("C"));
keyDown = keyboard_check(vk_down);
keyAttack = keyboard_check(ord("X"));


move = keyRight - keyLeft;

if(inAttackSwingCooldown){
	attackSwingTimer += 1;
}
if(attackSwingTimer == attackSwingCooldownTime){
	inAttackSwingCooldown = 0;
	attackSwingTimer = 0;
}

if(invulnerable == 1){
	flashAlpha -= 0.05;
	if(flashAlpha == 0 and invulnerableTicks > 0){
		flashAlpha = 1;
		invulnerableTicks -= 1;
	}
	else if (flashAlpha == 0 and invulnerableTicks == 0){
		invulnerable = 0;
		invulnerableTicks = 2;
	}
}

var healthPickup = instance_place(x+hsp,y+vsp,oHealthPickup)
if(healthPickup){
	currentHP = 5;
	instance_destroy(healthPickup);
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
	
	case PLAYERSTATE.HIT: PlayerState_Hit(); break;
	
	case PLAYERSTATE.DEAD: PlayerState_Dead(); break;
	
	case PLAYERSTATE.AIR_DOWN_ATTACK(): PlayerState_Aerial_Down_Slash(); break;
	
}