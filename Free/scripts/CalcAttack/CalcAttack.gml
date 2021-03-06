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
					}
					if((object_is_ancestor(object_index, pEntity) and entityCollision == true)
					or object_is_ancestor(object_index, pEnemy)){
						var _knockDirection = point_direction(x,y,other.x, other.y);
						//Calculate knockback based on mask_index (move type)
						switch (argument0) {
							case sAerial_Down_SlashHB:
								other.hsp = lengthdir_x(10, _knockDirection);
								other.vsp = max(-25, other.vsp - 60);
								other.inJump = 0;
								other.doubleJmp = 0;
								other.canDash = 1;
								break;
							case sGround_Attack_SlashHB:
								other.hsp = 13*sign(other.x-x);
								break;
						}
						with(other){
							if(global.playerHP != global.playerMaxHP){
								attacksInARow ++;
								if(attacksInARow >= gainHealthAfterAttacks){
									attacksInARow = 0;
									PlayerGainsHealth(1);
								}
							}
						}
					}
					if(entityHitScript != -1){
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
				if(enemyScript[ENEMYSTATE.HURT] != -1){
					if (state != ENEMYSTATE.HURT){
						statePrevious = state;
					}
					state = ENEMYSTATE.HURT;
				}
			}
			if(_knockback != 0){
				var _knockDirection = point_direction(x,y,(_source).x, (_source).y);
				xTo = x - lengthdir_x(_knockback, _knockDirection);
				yTo = y - lengthdir_y(_knockback, _knockDirection);
			}
		}
	}
}

function EnemyCalcAttack(){
	mask_index = argument0;
	var hitByAttackNow = ds_list_create();
	var hits = instance_place_list(x, y, oPlayer, hitByAttackNow, false);
	if (hits> 0){
		for (var i = 0; i<hits; i++){
			//If this instance has not yet been hit by this attack
			var hitID = hitByAttackNow[| i]; 
			if(ds_list_find_index(hitByAttack, hitID) == -1){
				ds_list_add(hitByAttack, hitID);
				with (hitID){
					if(sign(x-other.x) == 1){
						var _knockDirection = 0;
					}
					else{
						var _knockDirection = 180;
					}
					HurtPlayer(_knockDirection, other.enemyAttackKnockback, other.enemyAttackDamage);
				}
			}
		}
	}
	ds_list_destroy(hitByAttackNow);
	mask_index = sprIdle;
}