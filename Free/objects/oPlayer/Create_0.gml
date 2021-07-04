/// @description Insert description here
// You can write your code in this editor

vsp = 0					//Vertical Speed
hsp = 0					//Horizontal Speed
walksp = 0.25			//Walk speed
doubleJmp = 0			//Double jump used
flipRight = 0			//Flipping Right
flipLeft = 0			//Flipping Left
grv = 0.5				//Speed of gravity
holdingRight = 0		//Holding Right Wall
holdingLeft = 0			//Holding Left Wall
dashActive = 0			//Dashing	
dashCountTimer = 10;	//Dash count timer
flipActive = 0			//Flipping
flipCountTimer = 10;    //Flip count timer
jumped = 0				//Jump used
wallGrabFallSpeed = 0.5;//Speed at which falling when holding wall 
canDash = 1;            //Whether or not the player can currently dash


state = PLAYERSTATE.FREE;
hitByAttack = ds_list_create();




enum PLAYERSTATE
{
	FREE,
	ATTACK_SLASH,
	ATTACK_COMBO	
}
