// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function Knockback(hitID, knockbackAmountX, knockbackAmountY, dir){
	hitID.hsp = knockbackAmountX*dir;
	hitID.vsp = knockbackAmountY;
}