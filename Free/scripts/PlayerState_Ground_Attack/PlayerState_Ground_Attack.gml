// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function PlayerState_Ground_Attack(){
	image_speed = 1;
	hsp = 0;
	//Start of the attack
	
	if (sprite_index != sAttackSlash)
	{
		sprite_index = sAttackSlash;
		image_index = 0;
		ds_list_clear(hitByAttack);
	}
	CollisionDetection();
	mask_index = sAttackSlashHB;
	
	//Use attack hitbox and check for hits
	var hitByAttackNow = ds_list_create();
	var hits = instance_place_list(x, y, oEnemy, hitByAttackNow, false);
	
	if (hits> 0){
		for (var i = 0; i<hits; i++){
			//If this instance has not yet been hit by this attack
			var hitID = hitByAttackNow[| i]; 
			if(ds_list_find_index(hitByAttack, hitID) == -1){
				ds_list_add(hitByAttack, hitID);
				with (hitID){
					EnemyHit(1);
				}
			}
		}
	}
	
	ds_list_destroy(hitByAttackNow);
	mask_index = sIdle;
	
	if(animation_end()){
		sprite_index = sIdle;
		state = PLAYERSTATE.FREE;
	}
}