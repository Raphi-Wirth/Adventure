if(instance_exists(oMusic)){
	with(oMusic){
		if(_music == 0){
			_music = audio_play_sound(mLevel01, 1000, true);
		}
	}
}