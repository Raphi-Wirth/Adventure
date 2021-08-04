/// @description Insert description here
// You can write your code in this editor
event_inherited();

//Intrinsic variables
state = ENEMYSTATE.IDLE;
hsp = 0;
vsp = 0;
xTo = xstart;
yTo = ystart;
dir = 0;
aggroCheck = 0;
aggroCheckDuration = 5;
stateTarget = state;
statePrevious = state;
stateWait = 0;
stateWaitDuration = 0;


//Enemy Stats
timePassed = 0;
waitDuration = 60;
wait = 0;

//Scripts
enemyScript[ENEMYSTATE.IDLE] = -1;
enemyScript[ENEMYSTATE.WANDER] = -1;
enemyScript[ENEMYSTATE.CHASE] = -1;
enemyScript[ENEMYSTATE.ATTACK] = -1;
enemyScript[ENEMYSTATE.DIE] = -1;
enemyScript[ENEMYSTATE.WAIT] = EnemyWait;
enemyScript[ENEMYSTATE.HURT] = -1;

sprMove = sFlyingEnemy;
sprIdle = 0;
