/// @description Insert description here

if(!global.gamePaused){
	if(enemyScript[state] != -1){
		script_execute(enemyScript[state]);
	}
}
if(inAttackCooldown){
	attackCooldownTimer++;
	if(attackCooldownTimer >= enemyAttackCooldownTimer){
		attackCooldownTimer = 0;
		inAttackCooldown = 0;
	}
}