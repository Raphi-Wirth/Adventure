// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function EnemyTileCollision(){
	var _collision = false;
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
	x+= hsp;
	
	
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
	y += vsp;

	
	enemyTouchingWall = tilemap_get_at_pixel(collisionMap, x + hsp, y);
	enemyFallOffLedge = !tilemap_get_at_pixel(collisionMap, x + hsp, y+1);
	return _collision;
}