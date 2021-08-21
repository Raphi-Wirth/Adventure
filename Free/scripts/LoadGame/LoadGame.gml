// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function LoadGame(_slot){
	global.gameSaveSlot = _slot;
	var _file = "save" + string(global.gameSaveSlot) + ".sav";
	if(file_exists(_file)){
		//Load data
		var _json = LoadJSONFromFile(_file);
		
		//global variables
		global.playerHP = _json[? "playerHP"];
		global.playerMaxHP = _json[? "playerMaxHP"];
		global.targetX = _json[? "targetX"];
		global.targetY = _json[? "targetY"];
		global.hasSword =  _json[? "global.hasSword"];
		global.hasDash = _json[? "global.hasDash"];
		global.hasDoubleJump = _json[? "global.hasDoubleJump"];
		global.hasWallGrab = _json[? "global.hasWallGrab"];
		//Room
		RoomTransition(TRANS_TYPE.SLIDE, _json[? "room"]);
		ds_map_destroy(_json);
		
		return true;
	}
	else{
		global.targetX = -1;
		global.targetY = -1;
		RoomTransition(TRANS_TYPE.SLIDE, rTutorialTestR1);
	}
}

function LoadJSONFromFile(_filename){
	var _buffer = buffer_load(_filename);
	var _string = buffer_read(_buffer, buffer_string);
	buffer_delete(_buffer);
	var _json = json_decode(_string);
	return _json;
}