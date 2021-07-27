//Get player input
keyLeft = keyboard_check(vk_left);
keyRight = keyboard_check(vk_right);
keyJump = keyboard_check_pressed(vk_space);
keyDash = keyboard_check_pressed(ord("C"));
keyDown = keyboard_check(vk_down);
keyUp = keyboard_check(vk_up);
keyAttack = keyboard_check(ord("X"));
keyInteract = keyboard_check_pressed(ord("Z"));
polygon = polygon_from_instance(id);

move = keyRight - keyLeft;
if(!global.gamePaused){
	
	if(inAttackSwingCooldown){
	attackSwingTimer += 1;
	}
	if(attackSwingTimer == attackSwingCooldownTime){
		inAttackSwingCooldown = 0;
		attackSwingTimer = 0;
	}

	if(invulnerable == 1){
		Invulnerable();
	}

	var healthPickup = instance_place(x+hsp,y+vsp,oHealthPickup)
	if(healthPickup){
		PlayerGainsHealth(maxHP);
		instance_destroy(healthPickup);
	}

	switch (state)
	{
		case PLAYERSTATE.FREE: PlayerState_Free(); break;
	
		case PLAYERSTATE.DASH: PlayerState_Dash(dashDirection); break;
		
		case PLAYERSTATE.GROUND_ATTACK: PlayerState_Ground_Attack(); break;
	
		case PLAYERSTATE.GROUND_UP_ATTACK: PlayerState_Ground_Up_Attack(); break;
	
		case PLAYERSTATE.WALL_GRAB: PlayerState_Wall_Grab(); break;
	
		case PLAYERSTATE.DOUBLE_JUMP: PlayerState_Double_Jump(jumpDirection); break;
	
		case PLAYERSTATE.IN_AIR: PlayerState_In_Air(); break;
	
		case PLAYERSTATE.AIR_ATTACK: PlayerState_Air_Attack(); break;
	
		case PLAYERSTATE.HIT: PlayerState_Hit(); break;
	
		case PLAYERSTATE.DEAD: PlayerState_Dead(); break;
	
		case PLAYERSTATE.AIR_DOWN_ATTACK: PlayerState_Aerial_Down_Slash(); break;
	
		case PLAYERSTATE.AIR_UP_ATTACK: PlayerState_Aerial_Up_Attack(); break;
		
		case PLAYERSTATE.LOCKED: PlayerState_Locked(); break;
	}
}

depth = -1000;
