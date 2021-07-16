/// @description Insert description here
// You can write your code in this editor
currentHP = 5;
hsp = 0;
vsp = 0;
grv = 0.5;
intangible = 0;
aggrodAtX = xstart;
aggrodAtY = ystart;
flashColour = c_white;
flashAlpha = 0;
state = ENEMYSTATE.IDLE;
walksp = 1;
maxWalkSpeed = 3;
dir = 0;
hitByAttack = ds_list_create();
wanderRange = 200;


touchingLWall = 0;
touchingRWall = 0;
touchingFloor = 0;
collidingWall = 0;

function MoveTo(){
}

function Attack(){
}

function Idle(){
}
