/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event
event_inherited();
state = ENEMYSTATE.WANDER;
image_speed = 1;

//Enemy Sprites
sprMove = sGorgoWander;
sprHurt = sGorgoWander;
sprDie = sGorgoWander;

sideGripped = "Top";
enemyFallOffLedge = 0;
enemyTouchingWall = 0;
hsp = choose(-1,1)*enemySpeed;
image_xscale = sign(hsp);
vsp = 0;
increaseAngle = 0;
enemyScript[ENEMYSTATE.WANDER] = GorgoWander;
enemyScript[ENEMYSTATE.HURT] = GorgoWander;
enemyScript[ENEMYSTATE.DIE] = FadeToDie;