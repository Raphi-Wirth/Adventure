/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event
event_inherited();
waitDuration = 120;
wait = 0;
state = ENEMYSTATE.WANDER;
statePrevious = ENEMYSTATE.WANDER;
image_speed = 1;
enemyTouchingWall = 0;
enemyFallOffLedge = 0;

//Enemy Sprites
sprMove = sLeafletWalk;
sprChase = sLeafletChase;
sprIdle = sLeafletIdle;
sprDie = sLeafletIdle;
sprHurt = sLeafletIdle;
sprAttack = sLeafletChase;




enemyScript[ENEMYSTATE.WANDER] = GroundEnemyWander;
enemyScript[ENEMYSTATE.CHASE] = GroundEnemyChase;
enemyScript[ENEMYSTATE.ATTACK] = -1;
enemyScript[ENEMYSTATE.HURT] = GroundEnemyHurt;
enemyScript[ENEMYSTATE.DIE] = instance_destroy;




