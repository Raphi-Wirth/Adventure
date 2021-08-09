/// @description Insert description here
// You can write your code in this editor
collisionMap = layer_tilemap_get_id(layer_get_id("Collision"));

//Unlockables
hasSword = 1;
hasDash = 1;
hasWallGrab = 1;
hasDoubleJump = 1;

//Stats
attackSwingCooldownTime = 10;
playerHP = 5;
maxHP = playerHP;
hitStun = 15;

//Healthbar
healthbar_width = 400;
healthbar_height = 40;
healthbar_x = RESOLUTION_W/16;
healthbar_y = RESOLUTION_H/16;


instance_create_layer(x,y, "Instances" ,oParticleSystem);

//Intrinsic variables
vsp = 0						//Vertical Speed
hsp = 0						//Horizontal Speed
hspCarrySpeed = 0;
walksp = 2;					//Walk speed
playerFriction = 1;
attackSwingTimer = 0;
inAttackSwingCooldown = 0;
maxSpeed = 10;
doubleJmp = 0				//Double jump used
grv = 1;					//Speed of gravity
wallJumpDirection = 0;		//Which wall is currently being held
dashSpeed = maxSpeed*2;		//Horizontal speed while dashing
heightJumped = 0;
maxJumpHeight = 32*14;
jumpHeight = 35;
jumpSpeed = 20;
savedJumpIndex = 0;
inJump = 0;
initDashDirection = 0		//Put explanation here later
dashDirection = 1			//Initial dash direction
canDash = 1;				//Checks if player can dash
jumpDirection = 1;			//Initial Jump Direction
wallGrabFallSpeed = 1;	    //Speed at which falling when holding wall 
flash = 0;
invulnerable = 0;
flashColour = c_white;
flashShader = shWhiteFlash;
animationEndScript = -1;
canMoveWhileAct = 0;

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
	image_xscale = global.targetDirection;
	playerHP = global.playerHP;
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
	JUMP_SQUAT,
	ACT
}


