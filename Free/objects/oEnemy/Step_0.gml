/// @description Insert description here
// You can write your code in this editor

if(flashAlpha > 0){
	flashAlpha -= 0.05;
}



switch (state)
{
	case ENEMYSTATE.IDLE: EnemyState_Idle(); break;
		
	case ENEMYSTATE.DEAD: EnemyState_Dead(); break;
	
	case ENEMYSTATE.HIT: EnemyState_Hit(); break;
	
	case ENEMYSTATE.CHASE: MoveTo(); break;
	
	case ENEMYSTATE.IN_AIR: EnemyState_In_Air(); break;
	
	case ENEMYSTATE.ATTACK: Attack(); break;
}


