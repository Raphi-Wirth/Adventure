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

grid = mp_grid_create(0,0, room_width/32, room_height/32,32,32);
touchingLWall = 0;
touchingRWall = 0;
touchingFloor = 0;
collidingWall = 0;

function MoveTo(xVal, yVal, _speed){
	path = path_add();
	mp_grid_add_instances(path, oWall, false);
	mp_grid_add_instances(path, oFlyingEnemy, false);
	mp_grid_path(grid, path, x, y, xVal, yVal, 1);
	path_start(path, _speed, 0 , 1);
}

function Attack(){
}

function Idle(){
}

function Hit(){

}

function Die(){
}
