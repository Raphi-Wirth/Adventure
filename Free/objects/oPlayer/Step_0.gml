//Get player input
keyLeft = keyboard_check(vk_left);
keyRight = keyboard_check(vk_right);
keyJump = keyboard_check_pressed(ord("Z"));
keyHoldJump = keyboard_check(ord("Z"));
keyDash = keyboard_check_pressed(ord("C"));
keyDown = keyboard_check(vk_down);
keyUp = keyboard_check(vk_up);
keyAttack = keyboard_check(ord("X"));
keyInteract = keyboard_check_pressed(vk_space);
move = keyRight - keyLeft;
if(!global.gamePaused){
	if(inAttackSwingCooldown){
		attackSwingTimer += 1;
	}
	if(attackSwingTimer == attackSwingCooldownTime){
		inAttackSwingCooldown = 0;
		attackSwingTimer = 0;
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
		
		case PLAYERSTATE.GROUND_ATTACK: PlayerState_Ground_Attack(attackSprite, attackSpriteHitBox); break;
	
		case PLAYERSTATE.WALL_GRAB: PlayerState_Wall_Grab(); break;
	
		case PLAYERSTATE.IN_AIR: PlayerState_In_Air(); break;
	
		case PLAYERSTATE.AIR_ATTACK: PlayerState_Air_Attack(attackSprite, attackSpriteHitBox); break;
	
		case PLAYERSTATE.HIT: PlayerState_Hit(); break;
	
		case PLAYERSTATE.DEAD: PlayerState_Dead(); break;
		
		case PLAYERSTATE.LOCKED: PlayerState_Locked(); break;
		
		case PLAYERSTATE.TRANSITION: PlayerState_Transition(); break;
		
		case PLAYERSTATE.JUMP_SQUAT: PlayerState_Jump_Squat(); break;
		
		case PLAYERSTATE.ACT: PlayerState_Act(); break;
	}
	
	invulnerable = max(invulnerable-1,0);
	flash = max(flash-0.05,0);
}

if(y>room_height){
	state = PLAYERSTATE.DEAD;
}
depth = -bbox_bottom;


