/// @description Insert description here
// You can write your code in this editor
event_inherited();
if(inAttackCooldown){
	attackTimer += 1;
}
if(attackTimer == attackCooldownTime){
	inAttackCooldown = 0;
	attackTimer = 0;
}