/// @description Entity Setup
// You can write your code in this editor
flash = 0;
uFlash = shader_get_uniform(shWhiteFlash, "flash");
collisionMap = layer_tilemap_get_id(layer_get_id("Collision"));
_interactSprite = 0;