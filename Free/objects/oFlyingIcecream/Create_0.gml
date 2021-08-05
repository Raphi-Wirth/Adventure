/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event
event_inherited();
waitDuration = 2;
state = ENEMYSTATE.WANDER;
image_speed = 3;


//Enemy Sprites
sprMove = sFlyingIcecream;
sprIdle = sFlyingIcecream;
sprAttack = sFlying_Icecream_Attack;
sprDie = sFlyingIcecreamDie;
sprHurt = sFlyingIcecream;



enemyScript[ENEMYSTATE.WANDER] = FlyingIcecreamWander;
enemyScript[ENEMYSTATE.CHASE] = FlyingIcecreamChase;
enemyScript[ENEMYSTATE.ATTACK] = FlyingIcecreamAttack;
enemyScript[ENEMYSTATE.HURT] = FlyingIcecreamHurt;
enemyScript[ENEMYSTATE.DIE] = FlyingIcecreamDie;
