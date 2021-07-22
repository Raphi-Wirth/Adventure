// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function CollisionDetection(){
	
	//IntangibilityCheck(touchingRWall,touchingLWall,touchingFloor,collidingWall);
	
	

	var hsp_final = hsp + hspCarrySpeed;
	hspCarrySpeed = 0;
	//Horizontal Collision
		
	if(place_meeting(x + hsp_final, y, oWall))
	{
		while(!place_meeting(x + sign(hsp_final), y, oWall))
		{
			x += sign(hsp_final);
		}
		hsp = 0;
		hsp_final = 0;
	}

	x+=hsp_final;
	//Vertical Collision

	if(place_meeting(x,y+vsp, oWall)){
		while(!place_meeting(x,y+sign(vsp), oWall))
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
	
	y+=vsp;
	
	touchingFloor = instance_place(x,y+1, oWall);
	touchingRoof = instance_place(x,y-1, oWall);
	touchingLWall = instance_place(x-1,y, oWall);
	touchingRWall = instance_place(x+1, y, oWall);
	collidingWall = instance_place(x,y, oWall);
	collidingEnemy = instance_place(x,y,oEnemy);

	if(object_index == oPlayer){
		if(collidingEnemy and !invulnerable){
			PlayerHit(1);
			var xDiff = collidingEnemy.x - oPlayer.x;
			var yDiff = collidingEnemy.y - oPlayer.y;
			Knockback(oPlayer, 7 + hsp, -sign(yDiff)*5 + vsp, -sign(xDiff))
		}
	}
	
	
	if(collidingWall and (hsp and vsp)){
		//Checks for any current speed, sends you in the opposite direction
		if(sign(hsp) != sign(image_xscale)){
			while(instance_place(x,y, oWall)){
				x -= sign(hsp);
				y -= sign(vsp);
			}
		}
	}
	else if (collidingWall){
		while(instance_place(x,y,oWall)){
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