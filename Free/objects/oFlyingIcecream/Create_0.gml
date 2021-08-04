/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event
event_inherited();
waitDuration = 2;
state = ENEMYSTATE.WANDER;
image_speed = 3;


//Enemy Sprites
sprMove = sFlyingEnemy;
sprIdle = sFlyingEnemy;
sprAttack = sFlying_Icecream_Attack;



enemyScript[ENEMYSTATE.WANDER] = FlyingWander;
enemyScript[ENEMYSTATE.CHASE] = FlyingChase;
enemyScript[ENEMYSTATE.ATTACK] = FlyingAttack;