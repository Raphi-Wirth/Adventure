#region Particle Types

// Basic Particle
var _p = part_type_create();

part_type_shape(_p, pt_shape_cloud);
part_type_life(_p, 10, 20);
part_type_size(_p,0.1,0.3,0,0.01);

global.ptBasic = _p;

var _j = part_type_create();

part_type_shape(_j, pt_shape_cloud);
part_type_life(_j,15,25);
part_type_size(_j,0.3,0.5,0,0.05);
part_type_speed(_j,0.5,0.7,0,0);
part_type_direction(_j, 250, 300, 0,0);

global.ptJump = _j;

#endregion