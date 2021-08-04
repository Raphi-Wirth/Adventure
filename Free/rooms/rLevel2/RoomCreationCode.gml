if(instance_exists(oMusic)){
	with(oMusic){
		if(_music == 0){
			_music = audio_play_sound(mLevel01,1000,true);
		}
		audio_sound_gain(_music, 0.75, 500);
		if(_bgMusic != 0){
			audio_stop_sound(_bgMusic);
			_bgMusic = 0;
		}
	}
}