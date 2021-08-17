/// @description Entity Loop
// You can write your code in this editor
flash = max(flash - 0.04, 0);
if(entityActivateScript != -1 and entityInteractSprite != -1 and !instance_exists(_interactSprite)){
	if(abs(point_distance(x,y,oPlayer.x,oPlayer.y)) <= entityInteractDistance){
		_interactSprite = DisplaySprite(entityInteractSprite, 0, id, entityInteractDistance);
	}
}
 