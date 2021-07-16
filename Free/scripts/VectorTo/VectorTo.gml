// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function VectorTo(otherX,otherY){
	moveX = otherX - x;
	moveY = otherY - y;
	len = sqrt(sqr(moveX) + sqr(moveY));
	moveX = moveX/len;
	moveY = moveY/len;
	hsp = moveX;
	vsp = moveY;
	return [hsp, vsp]; 
}