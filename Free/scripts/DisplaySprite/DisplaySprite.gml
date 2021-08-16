// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function DisplaySprite(_sprite, _duration, _target, _fadeDistance){
	if(instance_exists(_target)){
		with(instance_create_layer(oPlayer.x,oPlayer.y,"Instances", oSpriteAboveHead)){
			duration = _duration;
			target = _target;
			sprite = _sprite;
			fadeDistance = _fadeDistance;
			x = _target.x;
			y = _target.y - sprite_height - 100;
			depth = -500;
		}
	}
}