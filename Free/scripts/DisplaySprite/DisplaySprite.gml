// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function DisplaySprite(_sprite, _duration, _target, _fadeDistance){
	if(instance_exists(_target)){
		with(instance_create_layer(oPlayer.x,oPlayer.y,"Instances", oSpriteAboveHead)){
			duration = _duration;
			target = _target;
			sprite = _sprite;
			fadeDistance = _fadeDistance;
			show_debug_message(fadeDistance);
			x = _target.x;
			y = _target.y - _target.sprite_height;
			depth = -500;
			return id;
		}
	}
}