/// @description Insert description here
// You can write your code in this editor
lerpProgress += (1 - lerpProgress) / 50;
if(abs(x1 - x1Target) <= x1Target/4){
	textProgress += min(global.textSpeed*string_length(message)/2, global.textSpeed*12);
}

x1 = lerp(x1, x1Target, lerpProgress);
x2 = lerp(x2, x2Target, lerpProgress);

//Cycle through responses
keyUp = keyboard_check_pressed(vk_up);
keyDown = keyboard_check_pressed(vk_down);
keyInteract = keyboard_check_pressed(vk_space);

responseSelected += (keyDown - keyUp);
var _max = array_length_1d(responses) - 1
var _min = 0;
if (responseSelected > _max) {
	responseSelected = _min;
}
if (responseSelected < _min) {
	responseSelected = _max;
}


if(oPlayer.keyInteract){
	var _messageLength = string_length(message);
	if(textProgress >= _messageLength){
		//If there are responses to be selected
		if(responses[0] != -1){
			with (originInstance) {
				//Get object interacted with to call script
				DialogueResponses(other.responseScripts[other.responseSelected]);
			}
		}
		if(instance_exists(oTextQueued)){
			//Reduce the ticket number of all queued text boxes by one
			with (oTextQueued){
				ticket -= 1;
			}
		}
		else{
			with(oPlayer){
				image_speed = 1;
				state = lastState;
			}
		}
		instance_destroy();
	}
	else{
		if(textProgress>2){
			textProgress = _messageLength;
		}
	}
}