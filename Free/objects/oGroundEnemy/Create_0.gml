/// @description Insert description here
// You can write your code in this editor
event_inherited();

function MoveTo(){
	if(abs(oPlayer.x-x) <= 10){
		dir = 0;
	}
	else{
		dir = sign(oPlayer.x - x);
	}
	hsp += dir*walksp;
	if(abs(hsp)>maxWalkSpeed){
		hsp = maxWalkSpeed*sign(hsp);
	}
	if(dir!=0){
		sprite_index = sEnemyWalk;
		image_xscale = dir;
		image_speed = 1;
	}
	else{
		sprite_index = sEnemyIdle;
	}
	Gravity();
	CollisionDetection();
	
	if(abs(oPlayer.x - x) < 70 and abs(oPlayer.y-y)<30){
		state = ENEMYSTATE.ATTACK;
	}
	if(sqrt(sqr(oPlayer.x - aggrodAtX) + sqr(oPlayer.y - aggrodAtY)) > 800){
		state = ENEMYSTATE.IDLE;
	}
	if((touchingRWall and touchingRWall.object_index == oWall)
	or (touchingLWall and touchingLWall.object_index == oWall)){
		if(!instance_place(x,y-30,oWall)){
			vsp = -10
			state = ENEMYSTATE.IN_AIR;
		}
	}
	x += hsp;
	y += vsp;
}

function Attack(){
	if(sprite_index != sEnemy_Ground_Attack_Slash){
		sprite_index = sEnemy_Ground_Attack_Slash;
		image_speed = 1;
		image_index = 0;
		ds_list_clear(hitByAttack);

	}
	var attackDirection = image_xscale;
	if(hsp != 0){
		hsp -= 0.5*sign(hsp);;
	}
	if(abs(hsp) <= 1){
		hsp = 0;
	}

	Gravity();
	CollisionDetection();
	mask_index = sEnemyAttackSlashHB;

	x+=hsp;
	y+=vsp;
	//Use attack hitbox and check for hits
	var hitByAttackNow = ds_list_create();
	var hits = instance_place_list(x, y, oPlayer, hitByAttackNow, false);
	
	if (hits> 0){
		for (var i = 0; i<hits; i++){
			//If this instance has not yet been hit by this attack
			var hitID = hitByAttackNow[| i]; 
			if(ds_list_find_index(hitByAttack, hitID) == -1){
				ds_list_add(hitByAttack, hitID);
				with (hitID){
					if(hitID.invulnerable != 1){
						PlayerHit(1);
						Knockback(hitID, 3, -3, attackDirection);
					}
				}
			}
		}
	}
	
	ds_list_destroy(hitByAttackNow);
	mask_index = sEnemyIdle;
	
	if(animation_end()){
		sprite_index = sEnemyIdle;
		state = ENEMYSTATE.CHASE;
	}
}
	