/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event
event_inherited();

state = ENEMYSTATE.WANDER;
image_speed = 1;
waitDuration = 120;
wait = 0;

//Enemy Sprites
sprIdle = sRockoIdle;
sprMove = sRockoWalk;
sprHurt = sRockoIdle;
sprDie = sRockoIdle;
sprAttack = sRockoAttack;
sprChase = sRockoWalk;

enemyFallOffLedge = 0;
enemyTouchingWall = 0;



enemyScript[ENEMYSTATE.WANDER] = GroundEnemyWander;
enemyScript[ENEMYSTATE.HURT] = GroundEnemyHurt;
enemyScript[ENEMYSTATE.ATTACK] = RockoAttack;
enemyScript[ENEMYSTATE.CHASE] = GroundEnemyChase;
enemyScript[ENEMYSTATE.DIE] = instance_destroy;