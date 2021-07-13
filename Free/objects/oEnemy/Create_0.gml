/// @description Insert description here
// You can write your code in this editor
hp = 5;
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


touchingLWall = 0;
touchingRWall = 0;
touchingFloor = 0;
collidingWall = 0;
