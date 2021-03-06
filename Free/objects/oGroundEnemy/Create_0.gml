/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event
event_inherited();
waitDuration = 30;
wait = 0;
state = ENEMYSTATE.WANDER;
image_speed = 1;
enemyTouchingWall = 0;
enemyFallOffLedge = 0;

//Enemy Sprites
sprMove = sEnemyWalk;
sprIdle = sEnemyWalk;
sprAttack = sEnemyWalk;
sprDie = sEnemyWalk;
sprHurt = sEnemyWalk;



enemyScript[ENEMYSTATE.WANDER] = GroundEnemyWander;
enemyScript[ENEMYSTATE.CHASE] = FlyingIcecreamChase;
enemyScript[ENEMYSTATE.ATTACK] = FlyingIcecreamAttack;
enemyScript[ENEMYSTATE.HURT] = FlyingIcecreamHurt;
enemyScript[ENEMYSTATE.DIE] = FlyingIcecreamDie;
