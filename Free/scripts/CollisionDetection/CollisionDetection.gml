// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function CollisionDetection(){
	
	//IntangibilityCheck(touchingRWall,touchingLWall,touchingFloor,collidingWall);
	
	
	var xDiff;
	var yDiff;



	
	
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
	
	var hsp_final = hsp + hspCarrySpeed;
	hspCarrySpeed = 0;
		
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
	
	collidingWall = instance_place(x,y, oWall);
	collidingEnemy = instance_place(x,y,oEnemy);
	
	if(object_index == oPlayer){
		if(collidingEnemy and !invulnerable){
			PlayerHit(1);
			xDiff = collidingEnemy.x - oPlayer.x;
			yDiff = collidingEnemy.y - oPlayer.y;
			Knockback(oPlayer, 7 + hsp, -sign(yDiff)*5 + vsp, -sign(xDiff))
		}
	}
	
	
	if(collidingWall != noone){
		show_debug_message("Collided");
		with(instance_place(x,y,oWall)){
			xDiff = oPlayer.x - x;
		}
		while(place_meeting(x,y,oWall)){
			x += sign(xDiff);
		}
		/*if(abs(xDiff)>=abs(yDiff)){
			while(place_meeting(x, y, oWall)){
				x += sign(xDiff);
				show_debug_message("XDiff");
				show_debug_message(xDiff);
				show_debug_message(x);
			}
		}
		else{
			while(place_meeting(x, y, oWall)){
				y += sign(yDiff);
				show_debug_message("YDiff");
				show_debug_message(yDiff);
				show_debug_message(y);
			}
		}*/
	}

	touchingFloor = instance_place(x,y+1, oWall);
	touchingRoof = instance_place(x,y-1, oWall);
	touchingLWall = instance_place(x-1,y, oWall);
	touchingRWall = instance_place(x+1, y, oWall);
	
	//Vertical Collision

}