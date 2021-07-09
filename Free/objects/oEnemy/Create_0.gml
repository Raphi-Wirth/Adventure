/// @description Insert description here
// You can write your code in this editor
hp = 5;
hsp = 5;
vsp = 0;
grv = 0.5;
flashColour = c_white;
flashAlpha = 0;
state = ENEMYSTATE.FREE
walksp = 5;

touchingLWall = 0;
touchingRWall = 0;
touchingFloor = 0;
collidingWall = 0;


enum ENEMYSTATE {
	FREE,
	DEAD,
	HIT
}