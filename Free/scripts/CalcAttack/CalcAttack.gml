// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function CalcAttack(){
	mask_index = argument0;
	var hitByAttackNow = ds_list_create();
	var hits = instance_place_list(x, y, pEntity, hitByAttackNow, false);
	if (hits> 0){
		for (var i = 0; i<hits; i++){
			//If this instance has not yet been hit by this attack
			var hitID = hitByAttackNow[| i]; 
			if(ds_list_find_index(hitByAttack, hitID) == -1){
				ds_list_add(hitByAttack, hitID);
				with (hitID){
					if(object_is_ancestor(object_index,pEnemy)){
						
						HurtEnemy(id, 1, other.id, 100);
						var _knockDirection = point_direction(x,y,other.x, other.y);
						
						//Calculate knockback based on mask_index (move type)
						switch (other.mask_index) {
							case sAerial_Down_SlashHB:
								other.hsp = lengthdir_x(10, _knockDirection);
								other.vsp = min(-20, vsp - 10);
						}
						
						
					}
					else if(entityHitScript != -1){
						script_execute(entityHitScript);
					}
				}
			}
		}
	}
	ds_list_destroy(hitByAttackNow);
	mask_index = sIdle;
}

function HurtEnemy(_enemy, _damage, _source, _knockback){
	with(_enemy){
		if(state != ENEMYSTATE.DIE){
			enemyHP -= _damage;
			flash = 1;
			
			//Hurt or dead?
			if(enemyHP <= 0){
				state = ENEMYSTATE.DIE;
			}
			else{
				if (state != ENEMYSTATE.HURT){
					statePrevious = state;
				}
				state = ENEMYSTATE.HURT;
			}
			
			imaged_index = 0;
			if(_knockback != 0){
				var _knockDirection = point_direction(x,y,(_source).x, (_source).y);
				xTo = x - lengthdir_x(_knockback, _knockDirection);
				yTo = y - lengthdir_y(_knockback, _knockDirection);
			}
		}
	}
}