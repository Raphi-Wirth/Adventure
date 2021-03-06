// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information

///@arg Message
///@arg Background
///@arg Placement
///@arg [Responses]
///@arg CharacterSprite


function NewTextBox(){
	var _obj;
	if (instance_exists(oText)){
		_obj = oTextQueued;
	}
	else {
		_obj = oText;
	}
	//Create text object
	with (instance_create_layer(0,0, "Instances", _obj)) {
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
			background = -1;
			
		}
		
		
		if(argument_count > 2){
			//Trim markers from responses
			responses = argument[2];
			for(var i = 0; i < array_length_1d(responses); i++){
				var _markerPosition = string_pos(":", responses[i]);
				responseScripts[i] = string_copy(responses[i], 1, _markerPosition - 1);
				responses[i] = string_delete(responses[i], 1, _markerPosition);
			}
		}
		else{
			responses = [-1];
			responseScripts = [-1];
		}
		if(argument_count > 3){
			textboxCharSprite = argument[3];
		}
		else{
			textboxCharSprite = -1;
		}
		if(argument_count > 4){
			if(argument_count == "Top"){
				y1 = 151
				y2 = 351;
			}
		}
	}

	with(oPlayer){
		if(state != PLAYERSTATE.LOCKED){
			lastState = state;
			state = PLAYERSTATE.LOCKED;
		}
	}
}