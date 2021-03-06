/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event
event_inherited();
hitByAttack = ds_list_create();
_hitCount = 0;
lastAttack = RockFilledHammerThrow;
attackTimePassed = 0;
attackTimeLimit = 1250;
enemyFallOffLedge = 0;
enemyTouchingWall = 0;
state = ENEMYSTATE.WANDER;
sprMove = sRockFilledMove;
sprHurt = sRockFilledIdle;
sprIdle = sRockFilledIdle;
sprChase = sRockFilledMove;
sprAttack = sRockFilledSmash;
sprAttackThrow = sRockFilledHammerThrow;
statePrevious = state;
enemyScript[ENEMYSTATE.WANDER] = GroundEnemyWander;
enemyScript[ENEMYSTATE.CHASE] = RockFilledChase;
enemyScript[ENEMYSTATE.ATTACK] = RockFilledSmash;
enemyScript[ENEMYSTATE.DIE] = instance_destroy;