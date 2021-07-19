#region Particle Types

// Basic Particle
var _p = part_type_create();

part_type_shape(_p, pt_shape_cloud);
part_type_life(_p, 10, 20);
part_type_size(_p,0.3,0.5,0,0.01);

global.ptBasic = _p;

var _j = part_type_create();

part_type_shape(_j, pt_shape_cloud);
part_type_life(_j,15,40);
part_type_size(_j,0.3,0.8,0,0.05);
part_type_speed(_j,0.5,1,0,0);
part_type_direction(_j, 250, 300, 0,0);

global.ptJump = _j;

var _wallGrab = part_type_create();

part_type_shape(_wallGrab, pt_shape_cloud);
part_type_life(_wallGrab,15,40);
part_type_size(_wallGrab,0.2,0.5,0,0);
part_type_speed(_wallGrab, 0.5, 1, 0, 0);
part_type_direction(_wallGrab, 88, 92, 0,0);

global.ptWallGrab = _wallGrab;

#endregion

#region EnemyBehaviour

enum ENEMYSTATE {
	CHASE,
	ATTACK,
	IDLE,
	DEAD,
	HIT,
	IN_AIR
}

enum ENEMYBEHAVIOUR {
	CHASE,
	IDLE,
	AGGRESSIVE,
	WANDER
}





#endregion
