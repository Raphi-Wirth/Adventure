// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function NewTextBox(){
	var _obj;
	if (instance_exists(oText)){
		_obj = oTextQueued;
	}
	else {
		_obj = oText;
	}
	//Create text object
	with (instance_create_layer(0,0, "Text", _obj)) {
		message = argument[0];
		//If being called by an object get their ID
		if (instance_exists(other)){
			originInstance = other.id;
		}
		else {
			originInstance = noone;
		}
	
	
		if(argument_count > 1){
			background = argument[1];
		}
		else{
			background = 1;
		}
	}

	with(oPlayer){
		if(state != PLAYERSTATE.LOCKED){
			lastState = state;
			state = PLAYERSTATE.LOCKED;
		}
	}
}