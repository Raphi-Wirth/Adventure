/// @description Update to players position
// You can write your code in this editor
collisionMap = layer_tilemap_get_id(layer_get_id("TilesMain"));
if(instance_exists(oPlayer)){
	x = oPlayer.x;
	y = oPlayer.y;
	//If camera view has changed
	view_w_half = camera_get_view_width(camera) * 0.5;
	view_h_half = camera_get_view_height(camera) * 0.5;
}