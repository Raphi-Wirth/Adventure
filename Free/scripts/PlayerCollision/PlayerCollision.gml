// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function PlayerCollision(){
	var _collision = false;
	var _entityList = ds_list_create();
	spriteWidth = 25;
	spriteHeight = 100;
	
	
	//Horizontal Tiles
	
	//Check horizontal points around feet
	if(tilemap_get_at_pixel(collisionMap, x + hsp + spriteWidth, y)){
		x -= (x + spriteWidth) mod TILE_SIZE;
		if (sign(hsp) == 1){
			x += TILE_SIZE -1;
		}
		else{
		}
		hsp = 0;
		_collision = true;
	}
	
	if(tilemap_get_at_pixel(collisionMap, x + hsp - spriteWidth, y)){
		x -= (x - spriteWidth) mod TILE_SIZE;
		if (sign(hsp) == 1){
			x += TILE_SIZE -1;
		}
		else{
		}
		hsp = 0;
		_collision = true;
	}
	
	
	//Check horizontal points around head
	if(tilemap_get_at_pixel(collisionMap, x + hsp + spriteWidth, y - spriteHeight)){
		x -= (x + spriteWidth) mod TILE_SIZE;
		if (sign(hsp) == 1){
			x += TILE_SIZE -1;
		}
		else{
		}
		hsp = 0;
		_collision = true;
	}
	
	if(tilemap_get_at_pixel(collisionMap, x + hsp - spriteWidth, y - spriteHeight)){
		x -= (x - spriteWidth) mod TILE_SIZE;
		if (sign(hsp) == 1){
			x += TILE_SIZE -1;
		}
		else{
		}
		hsp = 0;
		_collision = true;
	}
	

	//Horizontal Entities around feet
	var _entityCount = instance_position_list(x + spriteWidth + hsp, y, pEntity, _entityList, false);
	var _snapX;
	
	while(_entityCount > 0){
		var _entityCheck = _entityList[| 0];
		if(_entityCheck.entityCollision == true){
			//Move as close as we can
			if(sign(hsp) == -1){
				_snapX = _entityCheck.bbox_right + spriteWidth + 1;
			}
			else{
				_snapX = _entityCheck.bbox_left - spriteWidth +  1;
			}
			x = _snapX;
			hsp = 0;
			_collision = true;
			_entityCount = 0;
		}
		ds_list_delete(_entityList, 0);
		_entityCount--;
	}
	
	var _entityCount = instance_position_list(x - spriteWidth + hsp, y, pEntity, _entityList, false);
	var _snapX;
	
	while(_entityCount > 0){
		var _entityCheck = _entityList[| 0];
		if(_entityCheck.entityCollision == true){
			//Move as close as we can
			if(sign(hsp) == -1){
				_snapX = _entityCheck.bbox_right - spriteWidth + 1;
			}
			else{
				_snapX = _entityCheck.bbox_left + spriteWidth - 1;
			}
			x = _snapX;
			hsp = 0;
			_collision = true;
			_entityCount = 0;
		}
		ds_list_delete(_entityList, 0);
		_entityCount--;
	}
	
	//Horizontal entities around head
	var _entityCount = instance_position_list(x + spriteWidth + hsp, y - spriteHeight, pEntity, _entityList, false);
	var _snapX;
	
	while(_entityCount > 0){
		var _entityCheck = _entityList[| 0];
		if(_entityCheck.entityCollision == true){
			//Move as close as we can
			if(sign(hsp) == -1){
				_snapX = _entityCheck.bbox_right + spriteWidth + 1;
			}
			else{
				_snapX = _entityCheck.bbox_left - spriteWidth +  1;
			}
			x = _snapX;
			hsp = 0;
			_collision = true;
			_entityCount = 0;
		}
		ds_list_delete(_entityList, 0);
		_entityCount--;
	}
	
	var _entityCount = instance_position_list(x - spriteWidth + hsp, y - spriteHeight, pEntity, _entityList, false);
	var _snapX;
	
	while(_entityCount > 0){
		var _entityCheck = _entityList[| 0];
		if(_entityCheck.entityCollision == true){
			//Move as close as we can
			if(sign(hsp) == -1){
				_snapX = _entityCheck.bbox_right - spriteWidth + 1;
			}
			else{
				_snapX = _entityCheck.bbox_left + spriteWidth - 1;
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
	
	
	//Feet collision check
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
	
	if(tilemap_get_at_pixel(collisionMap, x - spriteWidth, y + vsp)){
		y -= y mod TILE_SIZE;
		if(sign(vsp) == 1){
			y+= TILE_SIZE - 1;
		}
		else{
		}
		vsp = 0;
		_collision = true;
	}
	
	if(tilemap_get_at_pixel(collisionMap, x + spriteWidth, y + vsp)){
		y -= y mod TILE_SIZE;
		if(sign(vsp) == 1){
			y+= TILE_SIZE - 1;
		}
		else{
		}
		vsp = 0;
		_collision = true;
	}
	
	//Head collision check
	if(tilemap_get_at_pixel(collisionMap, x, y + vsp - spriteHeight)){
		y -= (y-spriteHeight) mod TILE_SIZE;
		if(sign(vsp) == 1){
			y+= TILE_SIZE - 1;
		}
		else{
		}
		vsp = 0;
		_collision = true;
	}
	
	if(tilemap_get_at_pixel(collisionMap, x - spriteWidth, y + vsp - spriteHeight)){
		y -= (y-spriteHeight) mod TILE_SIZE;
		if(sign(vsp) == 1){
			y+= TILE_SIZE - 1;
		}
		else{
		}
		vsp = 0;
		_collision = true;
	}
	
	if(tilemap_get_at_pixel(collisionMap, x + spriteWidth, y + vsp - spriteHeight)){
		y -= (y-spriteHeight) mod TILE_SIZE;
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
	
	if(instance_position(x,y+1, pEntity)){
		with(instance_position(x,y+1,pEntity)){
			if(entityCollision == true){
				touchingFloor = true;
			}
		}
	}
	touchingFloor = tilemap_get_at_pixel(collisionMap, x, y+1)
	or tilemap_get_at_pixel(collisionMap, x-spriteWidth, y+1)
	or tilemap_get_at_pixel(collisionMap, x+spriteWidth, y+1);
	touchingRoof = tilemap_get_at_pixel(collisionMap, x, y-1-spriteHeight);
	touchingRWall = tilemap_get_at_pixel(collisionMap, x+spriteWidth + 1, y);
	touchingLWall = tilemap_get_at_pixel(collisionMap, x-spriteWidth - 1, y);
	ds_list_destroy(_entityList);
	
	return _collision;
}