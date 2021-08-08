// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
#macro RESOLUTION_W 1920
#macro RESOLUTION_H 1080
#macro CARDINAL_DIR round(direction/180)
#macro ROOM_START rLevel1
#macro TILE_SIZE 32

#macro TRANSITION_SPEED 0.035
#macro OUT 0
#macro IN 1

#region Particle Types

// Basic Particle
var _p = part_type_create();

part_type_shape(_p, pt_shape_cloud);
part_type_life(_p, 12, 22);
part_type_size(_p,1,1.5,-0.05,0.01);

global.ptBasic = _p;

var _j = part_type_create();

part_type_shape(_j, pt_shape_cloud);
part_type_life(_j,15,40);
part_type_size(_j,1,2,0,0.05);
part_type_speed(_j,2,3,0,0);
part_type_direction(_j, 250, 300, 0,0);

global.ptJump = _j;

var _wallGrab = part_type_create();

part_type_shape(_wallGrab, pt_shape_cloud);
part_type_life(_wallGrab,15,40);
part_type_size(_wallGrab,0.2,0.5,0,0);
part_type_speed(_wallGrab, 0.5, 1, 0, 0);
part_type_direction(_wallGrab, 88, 92, 0,0);

global.ptWallGrab = _wallGrab;

var _jumpLand = part_type_create();

part_type_shape(_jumpLand, pt_shape_cloud);
part_type_life(_jumpLand,15,40);
part_type_size(_jumpLand,1,2,0,0.05);
part_type_speed(_jumpLand,-2,2,0,0);
part_type_direction(_jumpLand, 180, 180, 0,0);

global.ptJumpLand = _jumpLand;

#endregion

#region EnemyBehaviour

enum ENEMYSTATE {
	CHASE,
	WANDER,
	ATTACK,
	IDLE,
	DIE,
	HURT,
	WAIT
}



#endregion

#region TEXT BOXES
	///@function funcNineSliceBoxStretched(_sprite, _x1, _y1, _x2, _y2, _index);
	///@param {sprite}	sprite	The sprite used to make the text boxes
	///@param {position}	x1		The left position of the text box
	///@param {position}	y1		The top position of the text box
	///@param {position}	x2		The right position of the text box
	///@param {position}	y2		The bottom position of the text box
	///@param {real}		index	The image index of the sprite used
	
	function funcNineSliceBoxStretched(_sprite, _x1, _y1, _x2, _y2, _index) {
		
		var _size = sprite_get_width(_sprite) / 3;
		var _w = _x2 - _x1;
		var _h = _y2 - _y1

		//MIDDLE
		draw_sprite_part_ext(_sprite, _index, _size, _size, 1, 1, _x1 + _size,_y1 + _size, _w - (_size * 2), _h - (_size * 2), c_white,1);

		//CORNERS
		//TOP LEFT
		draw_sprite_part(_sprite, _index, 0, 0, _size, _size, _x1, _y1);
		//TOP RIGHT
		draw_sprite_part(_sprite, _index, _size * 2, 0, _size, _size, _x1 + _w - _size, _y1);
		//BOTTOM LEFT
		draw_sprite_part(_sprite, _index, 0, _size * 2, _size, _size, _x1, _y1 + _h - _size);
		//BOTTOM RIGHT
		draw_sprite_part(_sprite, _index, _size * 2, _size * 2, _size, _size, _x1 + _w - _size, _y1 + _h - _size);

		//EDGES
		//LEFT
		draw_sprite_part_ext(_sprite, _index, 0, _size, _size, 1, _x1, _y1 + _size, 1, _h - (_size * 2), c_white, 1);
		//RIGHT
		draw_sprite_part_ext(_sprite, _index, _size * 2, _size, _size, 1, _x1 + _w - _size, _y1 + _size, 1, _h - (_size * 2), c_white, 1);
		//TOP
		draw_sprite_part_ext(_sprite, _index, _size, 0, 1, _size, _x1 + _size, _y1, _w - (_size * 2), 1, c_white, 1);
		//BOTTOM
		draw_sprite_part_ext(_sprite, _index, _size, _size * 2, 1, _size, _x1 + _size, _y1 + _h - (_size), _w - (_size * 2), 1, c_white,1);
	
	}
#endregion