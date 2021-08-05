/// @description Insert description here
// You can write your code in this editor
bulletSpeed = 0;
_knockBack = 0
bulletColour = irandom_range(1,2);
collisionMap = layer_tilemap_get_id(layer_get_id("Collision"));
dir = 0;

switch (bulletColour) {
	case 1: sprite_index = sBulletChocolate; break;
	
	case 2: sprite_index = sBulletStrawberry; break;	
}

xTo = x;
yTo = y;