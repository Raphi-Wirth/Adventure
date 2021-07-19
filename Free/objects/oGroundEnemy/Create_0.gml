/// @description Insert description here
// You can write your code in this editor
event_inherited();
function Hit(){
	if(sprite_index != sEnemyHit){
		sprite_index = sEnemyHit;
	}
	if(flashAlpha > 0){
		flashAlpha -= 0.05;
	}
	else if(flashAlpha == 0){
		state = ENEMYSTATE.CHASE;
	}
	Gravity();
	CollisionDetection();
	x+=hsp;
	y+=vsp;
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

function Idle(){
	hsp = 0;
	sprite_index = sEnemyIdle;
	Gravity();
	CollisionDetection();
	
	if(distance_to_object(oPlayer) < 300){
		aggrodAtX = x;
		aggrodAtY = y;
		state = ENEMYSTATE.CHASE;
	}
	x+=hsp;
	y+=vsp;
}