/// @description Insert description here
// You can write your code in this editor
event_inherited();

hasSword = 1;
hasDash = 0;
hasWallGrab = 0;
hasDoubleJump = 1;
invulnerable = 0;
invulnerableTicks = 2;
attackSwingCooldownTime = 10;
attackSwingTimer = 0;
inAttackSwingCooldown = 0;
intangible = 0;
currentHP = 5;
maxHP = currentHP;
healthbar_width = 400;
healthbar_height = 40;
healthbar_x = RESOLUTION_W/16;
healthbar_y = RESOLUTION_H/16;

hspCarrySpeed = 0;
instance_create_layer(x,y, "Instances" ,oParticleSystem);


vsp = 0						//Vertical Speed
hsp = 0						//Horizontal Speed
walksp = 2;					//Walk speed
maxSpeed = 10;
doubleJmp = 0				//Double jump used
flipRight = 0				//Flipping Right
flipLeft = 0				//Flipping Left
grv = 1;					//Speed of gravity
wallJumpDirection = 0;		//Which wall is currently being held
dashSpeed = maxSpeed*2;		//Horizontal speed while dashing
heightJumped = 0;
maxJumpHeight = 32*12;
jumpHeight = 35;
jumpSpeed = 20;
savedJumpIndex = 0;
inJump = 0;
initDashDirection = 0		//Put explanation here later
dashDirection = 1			//Initial dash direction
canDash = 1;				//Checks if player can dash
jumpDirection = 1;			//Initial Jump Direction
wallGrabFallSpeed = 1;	    //Speed at which falling when holding wall 
flashAlpha = 0;
flashColour = c_white;
hitStun = 15;

state = PLAYERSTATE.FREE;
lastState = state;
hitByAttack = ds_list_create();

touchingRoof = 0;
touchingLWall = 0;
touchingRWall = 0;
touchingFloor = 0;
collidingWall = 0;

if(global.targetX != -1){
	x = global.targetX;
	y = global.targetY;
	direction = global.targetDirection;
	currentHP = global.currentHP;
}



enum PLAYERSTATE
{
	FREE,
	GROUND_ATTACK,
	GROUND_UP_ATTACK,
	DASH,
	WALL_GRAB,
	IN_AIR,
	AIR_ATTACK,
	AIR_UP_ATTACK,
	HIT,
	DEAD,
	AIR_DOWN_ATTACK,
	LOCKED,
	TRANSITION,
	JUMP_SQUAT
}


