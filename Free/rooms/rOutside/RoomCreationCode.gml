if(instance_exists(oMusic)){
	with(oMusic){
		if(_bgMusic == 0){
			_bgMusic = audio_play_sound(mForestBGNoise, 1000, true);
		}
		if(_music != 0){
			audio_sound_gain(_music, 0.25, 500);
		}
	}
}