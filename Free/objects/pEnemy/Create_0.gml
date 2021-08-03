/// @description Insert description here
// You can write your code in this editor
event_inherited();

state = ENEMYSTATE.IDLE;
hsp = 0;
vsp = 0;
xTo = xstart;
yTo = ystart;
dir = 0;
timePassed = 0;
waitDuration = 60;
wait = 0;

enemyScript[ENEMYSTATE.IDLE] = -1;
enemyScript[ENEMYSTATE.WANDER] = -1;
enemyScript[ENEMYSTATE.CHASE] = -1;
enemyScript[ENEMYSTATE.ATTACK] = -1;
enemyScript[ENEMYSTATE.DIE] = -1;
enemyScript[ENEMYSTATE.WAIT] = -1;
enemyScript[ENEMYSTATE.HURT] = -1;

sprMove = sFlyingEnemy;
sprIdle = 0;
