// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function EnemyState_Ground_Attack(attackDirection){
	if(sprite_index != sEnemy_Ground_Attack_Slash){
		sprite_index = sEnemy_Ground_Attack_Slash;
		image_speed = 1;
		image_index = 0;
		if(attackDirection!=0){
			image_xscale = attackDirection;
		}
		ds_list_clear(hitByAttack);

	}
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
						hitID.vsp -= 3;
						hitID.hsp -= 3*-attackDirection
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