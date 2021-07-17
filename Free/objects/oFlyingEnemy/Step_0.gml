/// @description Insert description here
// You can write your code in this editor
hsp = 0;
vsp = 0;
event_inherited();
x+=hsp;
y+=vsp;
if(inAttackCooldown){
	attackTimer += 1;
}
if(attackTimer == attackCooldownTime){
	inAttackCooldown = 0;
	attackTimer = 0;
}