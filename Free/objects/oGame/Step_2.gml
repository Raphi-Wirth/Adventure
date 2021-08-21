/// @description Pause the game
// You can write your code in this editor
if (keyboard_check_pressed(vk_escape) and instance_exists(oPlayer)) {
	global.gamePaused = !global.gamePaused;
	if(global.gamePaused){
		if(!instance_exists(oMenu)){
			with(instance_create_layer(x,y,"Instances", oMenu)){
				PauseMenu();
			}
		}
		with (all) {
			gamePausedImageSpeed = image_speed;
			image_speed = 0;
		}

	}
	else{
		if(instance_exists(oMenu)){
			instance_destroy(oMenu);
		}
		with (all) {
			image_speed = gamePausedImageSpeed;
		}
	}
}