/// @description Insert description here
// You can write your code in this editor
switch(upgradeType){
	case 0:
		global.hasDoubleJump = 1; NewTextBox("Double Jump Acquired");
		if(instance_exists(oText)){
			with(oText){
				y1 = RESOLUTION_H/2-150;
				y2 = RESOLUTION_H/2+150;
				hAlign = fa_center;
				vAlign = fa_center;
			}
		}break
}
instance_destroy();