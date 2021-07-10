// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function EnemyState_In_Air(){
	if(abs(oPlayer.x-x) <= 2){
		dir = 0;
	}
	else{
		dir = sign(oPlayer.x - x);
	}
	hsp = dir * walksp;
	Gravity();
	CollisionDetection();
	
	if(vsp<0){
		sprite_index = sJump;
		if(vsp<-7){
			image_index = 0;
		}
		else if (vsp < -3 and vsp >= -7){
			image_index = 1;
		} 
		else if (vsp < 0 and vsp >= -3){
			image_index = 2;
		}
	}
	if(vsp>= 0){
		if (vsp >= 0 and vsp < 2){
			sprite_index = sFall;
			image_index = 0;
		}
		else if (vsp >= 2){
			sprite_index = sFall;
			image_index = 1;
		}
	}
	if(touchingFloor){
		state = ENEMYSTATE.IDLE;
	}
	x+=hsp;
	y+=vsp;
}