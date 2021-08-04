if(instance_exists(oMusic)){
	with(oMusic){
		if(_music != 0){
			audio_sound_gain(_music, 1, 500);
		}

		if(_bgMusic != 0){
			audio_stop_sound(_bgMusic);
		}
	}
}