/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event
event_inherited();
hitByAttack = ds_list_create();
enemyFallOffLedge = 0;
enemyTouchingWall = 0;
state = ENEMYSTATE.WANDER;
sprMove = sRockFilledMove;
sprHurt = sRockFilledIdle;
sprIdle = sRockFilledIdle;
sprChase = sRockFilledMove;
sprAttack = sRockFilledSmash;
enemyScript[ENEMYSTATE.WANDER] = GroundEnemyWander;
enemyScript[ENEMYSTATE.CHASE] = GroundEnemyChase;
enemyScript[ENEMYSTATE.ATTACK] = RockFilledAttack;
enemyScript[ENEMYSTATE.HURT] = GroundEnemyHurt;
enemyScript[ENEMYSTATE.DIE] = instance_destroy;