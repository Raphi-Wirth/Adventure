/// @description Insert description here
// You can write your code in this editor
with (oPlayer) {
	var _xKnockVal = lengthdir_x(other._knockback, other.dir)/2;
	var _yKnockVal = lengthdir_y(other._knockback, other.dir)/2;
	hsp = min(10*sign(_xKnockVal), _xKnockVal);
	vsp = min(10*sign(_yKnockVal), _yKnockVal);
	PlayerHit(1);
}

instance_destroy();