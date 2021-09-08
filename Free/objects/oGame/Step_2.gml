/// @description Pause the game
// You can write your code in this editor
if (keyboard_check_pressed(vk_escape) and instance_exists(oPlayer)) {
	global.gamePaused = !global.gamePaused;
	if(global.gamePaused){
		instance_create_layer(x,y,"Instances", oPauseMenu);
		with (all) {
			gamePausedImageSpeed = image_speed;
			image_speed = 0;
		}

	}
	else{
		if(instance_exists(oPauseMenu)){
			instance_destroy(oPauseMenu);
		}
		with (all) {
			try {
				image_speed = gamePausedImageSpeed;
			}
			catch(_exception){
			}
		}
	}
}