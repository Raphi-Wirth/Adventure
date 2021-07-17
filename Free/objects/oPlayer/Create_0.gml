/// @description Insert description here
// You can write your code in this editor


invulnerable = 0;
invulnerableTicks = 2;
attackSwingCooldownTime = 10;
attackSwingTimer = 0;
inAttackSwingCooldown = 0;
intangible = 0;
currentHP = 25;
maxHP = currentHP;
healthbar_width = 200;
healthbar_height = 20;
healthbar_x = 640/12;
healthbar_y = 50;




vsp = 0						//Vertical Speed
hsp = 0						//Horizontal Speed
walksp = 1;					//Walk speed
doubleJmp = 0				//Double jump used
flipRight = 0				//Flipping Right
flipLeft = 0				//Flipping Left
grv = 0.5;					//Speed of gravity
wallJumpDirection = 0;		//Which wall is currently being held
dashSpeed = 10;				//Horizontal speed while dashing
initDashDirection = 0		//Put explanation here later
dashDirection = 1			//Initial dash direction
canDash = 1;				//Checks if player can dash
jumpDirection = 1;			//Initial Jump Direction
wallGrabFallSpeed = 0.75;	//Speed at which falling when holding wall 
fastFall = 0;				//Whether the player is currently in fastfall
flashAlpha = 0;
flashColour = c_white;


state = PLAYERSTATE.FREE;
hitByAttack = ds_list_create();

touchingLWall = 0;
touchingRWall = 0;
touchingFloor = 0;
collidingWall = 0;




enum PLAYERSTATE
{
	FREE,
	GROUND_ATTACK,
	GROUND_UP_ATTACK,
	DASH,
	WALL_GRAB,
	IN_AIR,
	DOUBLE_JUMP,
	AIR_ATTACK,
	HIT,
	DEAD,
	AIR_DOWN_ATTACK
}
