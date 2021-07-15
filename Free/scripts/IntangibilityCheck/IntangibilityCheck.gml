// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function IntangibilityCheck(touchingRWall, touchingLWall, touchingFloor, collidingWall){
	if(touchingRWall.intangible == 1){
		touchingRWall = 0;
	}
	if(touchingLWall.intangible == 1){
		touchingLWall = 0;
	}
	if(touchingFloor.intangible == 1){
		touchingFloor = 0;
	}
	if(collidingWall.intangible == 1){
		collidingWall = 0;
	}
}