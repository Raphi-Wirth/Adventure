/// @description Drop fragments & items
// You can write your code in this editor
if (entityFragmentCount > 0){
	fragmentArray = array_create(entityFragmentCount, entityFragment);
	if(abs(x-oPlayer.x) < 20){
		dirHit = 0;
	}
	else{
		dirHit = sign(x-oPlayer.x);
	}
	DropItems(x,y,fragmentArray, entityFragmentSpeed, dirHit);
}
if(entityDestroySound != -1){
	audio_play_sound(entityDestroySound, 10, false);
}