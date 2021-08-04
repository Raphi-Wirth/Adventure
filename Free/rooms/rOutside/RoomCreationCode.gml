if(instance_exists(oMusic)){
	with(oMusic){
		if(_bgMusic == 0){
			_bgMusic = audio_play_sound(mForestBGNoise, 1000, true);
		}
	}
}