/// @description Insert description here
// You can write your code in this editor
if(sprite_index == sTutorialGuyIdle){
	smokeCount ++;
}

if(smokeCount > smokeAfter){
	sprite_index = sTutorialGuySmoke;
	smokeCount = 0;
}
if(animation_end(sTutorialGuySmoke)){
	sprite_index = sTutorialGuyIdle;
}