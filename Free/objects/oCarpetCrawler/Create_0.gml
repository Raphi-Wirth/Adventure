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
sprMove = sCarpetCrawlerCrawl;
sprIdle = sCarpetCrawlerIdle;
sprDie = sCarpetCrawlerIdle;
sprHurt = sCarpetCrawlerIdle;
sprChase = sCarpetCrawlerCrawl;




enemyScript[ENEMYSTATE.WANDER] = GroundEnemyWander;
enemyScript[ENEMYSTATE.CHASE] = GroundEnemyChase;
enemyScript[ENEMYSTATE.HURT] = GroundEnemyHurt;
enemyScript[ENEMYSTATE.DIE] = FadeToDie;

