if(instance_exists(oMusic)){
	with(oMusic){
		audio_sound_gain(_music, 0, 5000);
		if(audio_sound_get_gain(_music) == 0){
			_music = 0;
		}
	}
}