// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function PlayerCollision(){
	var _collision = false;
	var _entityList = ds_list_create();
	
	//Horizontal Tiles
	if(tilemap_get_at_pixel(collisionMap, x + hsp, y)){
		x -= x mod TILE_SIZE;
		if (sign(hsp) == 1){
			x += TILE_SIZE -1;
		}
		else{
		}
		hsp = 0;
		_collision = true;
	}

	//Horizontal Entities
	var _entityCount = instance_position_list(x + hsp, y, pEntity, _entityList, false);
	var _snapX;
	
	while(_entityCount > 0){
		var _entityCheck = _entityList[| 0];
		if(_entityCheck.entityCollision == true){
			//Move as close as we can
			if(sign(hsp) == -1){
				_snapX = _entityCheck.bbox_right + 1;
			}
			else{
				_snapX = _entityCheck.bbox_left - 1;
			}
			x = _snapX;
			hsp = 0;
			_collision = true;
			_entityCount = 0;
		}
		ds_list_delete(_entityList, 0);
		_entityCount--;
	}
	
	
	
	//Horizontal movement commit
	x += hsp;
	
	
	//Clear list between axis
	ds_list_clear(_entityList);
	
	
	
	if(tilemap_get_at_pixel(collisionMap, x, y + vsp)){
		y -= y mod TILE_SIZE;
		if(sign(vsp) == 1){
			y+= TILE_SIZE - 1;
		}
		else{
		}
		vsp = 0;
		_collision = true;
	}

	//Vertical Entities
	var _entityCount = instance_position_list(x, y + vsp, pEntity, _entityList, false);
	var _snapY;
	
	while(_entityCount > 0){
		var _entityCheck = _entityList[| 0];
		if(_entityCheck.entityCollision == true){
			//Move as close as we can
			if(sign(vsp) == -1){
				_snapY = _entityCheck.bbox_bottom + 1;
			}
			else{
				_snapY = _entityCheck.bbox_top- 1;
			}
			y = _snapY;
			vsp = 0;
			_collision = true;
			_entityCount = 0;
		}
		ds_list_delete(_entityList, 0);
		_entityCount--;
	}
	
	//Vertical move commit
	y += vsp;
	touchingFloor = tilemap_get_at_pixel(collisionMap, x, y+1) or position_meeting(x,y+1,pEntity);
	touchingRoof = tilemap_get_at_pixel(collisionMap, x, y-1) or position_meeting(x,y-1,pEntity);
	touchingRWall = tilemap_get_at_pixel(collisionMap, x+1, y) or position_meeting(x+1,y,pEntity);
	touchingLWall = tilemap_get_at_pixel(collisionMap, x-1, y) or position_meeting(x-1,y,pEntity);
	
	ds_list_destroy(_entityList);
	
	return _collision;
}