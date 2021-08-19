// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function DeleteGame(_filename){
	var _file = "save" + string(global.gameSaveSlot) + ".sav";
	if(file_exists(_file)){
		file_delete(_file);
	}
}