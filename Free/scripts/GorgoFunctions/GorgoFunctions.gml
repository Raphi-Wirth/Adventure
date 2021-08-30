// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function GorgoWander(){
	if(enemyFallOffLedge == 1){
		if(sideGripped == "Top"){
			if(hsp>0){
				sideGripped = "Right";
				vsp = enemySpeed;
				hsp = 0;
			}
			else{
				sideGripped = "Left";
				vsp = enemySpeed;
				hsp = 0;
			}
		}
		else if(sideGripped == "Bottom"){
			if(hsp>0){
				sideGripped = "Right";
				vsp = -enemySpeed;
				hsp = 0;
			}
			else{
				sideGripped = "Left";
				vsp = -enemySpeed;
				hsp = 0;
			}
		}
		else if(sideGripped == "Left"){
			if(vsp>0){
				sideGripped = "Bottom";
				hsp = enemySpeed;
				vsp = 0;
			}
			else{
				sideGripped = "Top";
				hsp = enemySpeed;
				vsp = 0;
			}
		}
		else if(sideGripped == "Right"){
			if(vsp>0){
				sideGripped = "Bottom";
				hsp = -enemySpeed;
				vsp = 0;
			}
			else{
				sideGripped = "Top";
				hsp = -enemySpeed;
				vsp = 0;
			}
		}
		increaseAngle = 1;
	}
	if(image_xscale == 1){
		if(increaseAngle){
			image_angle -= 5;
			if(abs(image_angle) mod 90 = 0){
				increaseAngle = 0;
			}
		}
	}
	if(image_xscale == -1){
		if(increaseAngle){
			image_angle += 5;
			if(abs(image_angle) mod 90 = 0){
				increaseAngle = 0;
			}
		}
	}
	GorgoTileCollision(sideGripped);
}