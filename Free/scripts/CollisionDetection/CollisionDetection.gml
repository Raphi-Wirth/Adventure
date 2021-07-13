// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function CollisionDetection(){
	touchingFloor = instance_place(x,y+1, oWall);
	touchingLWall = instance_place(x-1,y, all);
	touchingRWall = instance_place(x+1,y, all);
	collidingWall = instance_place(x,y, oWall);
	
	//IntangibilityCheck(touchingRWall,touchingLWall,touchingFloor,collidingWall);
	
	if(touchingFloor or touchingLWall or touchingRWall or collidingWall){
		if(collidingWall != 0 and (hsp and vsp)){
			//Checks for any current speed, sends you in the opposite direction
			if(sign(hsp) != sign(image_xscale)){
				while(instance_place(x,y, collidingWall)){
					x -= sign(hsp);
					y -= sign(vsp);
				}
			}
		}
		else if (collidingWall !=0){
			while(instance_place(x,y,collidingWall)){
				xDiff = collidingWall.x - x;
				yDiff = collidingWall.y - y;
				len = sqrt(sqr(xDiff) + sqr(yDiff));
				moveX = xDiff/len;
				moveY = yDiff/len;
				x -= moveX;
				y -= moveY;
			}
		}
	}
	

	
	//Horizontal Colission
	
		
	if(place_meeting(x + hsp, y, all))
	{
		while(!place_meeting(x + sign(hsp), y, all))
		{
			x += sign(hsp);
		}
		hsp = 0;
	}


	//Vertical Collision

	if(place_meeting(x,y+vsp, all)){
		while(!place_meeting(x,y+sign(vsp), all))
		{	
		
			y += sign(vsp);
		}
		if(vsp > 0){
			canDash = 1;
			doubleJmp = 0;
			flipRight = 0;
			flipLeft = 0;
		}
		vsp = 0;
	}

}