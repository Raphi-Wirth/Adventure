// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function SaveGame(){
	var _map = ds_map_create();
	
	_map[? "room"] = room;
	_map[? "playerHP"] = global.playerHP;
	_map[? "playerMaxHP"] = global.playerMaxHP;
	_map[? "targetX"] = global.targetX;
	_map[? "targetY"] = global.targetY;
	_map[? "hasSword"] = global.hasSword;
	_map[? "hasDash"] = global.hasDash;
	_map[? "hasDoubleJump"] = global.hasDoubleJump;
	_map[? "hasWallGrab"] = global.hasWallGrab;
	
	/*var _questMap = ds_map_create();
	ds_map_copy(_questMap, global.questStatus);
	ds_map_add_map(_map, "questStatus", _questMap);*/
	
	//Save all data to a JSON string
	var _string = json_encode(_map);
	SaveStringToFile("save" + string(global.gameSaveSlot) + ".sav", _string);
	show_debug_message(_string);
	
	//Delete data
	ds_map_destroy(_map);
	show_debug_message("Game Saved");
}

function SaveStringToFile(_filename, _string){
	var _buffer = buffer_create(string_byte_length(_string) + 1, buffer_fixed, 1);
	buffer_write(_buffer, buffer_string, _string);
	buffer_save(_buffer,_filename);
	buffer_delete(_buffer);
}