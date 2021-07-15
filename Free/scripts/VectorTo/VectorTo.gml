// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function VectorTo(objID){
	moveX = objID.x - x;
	moveY = objID.y - y;
	len = sqrt(sqr(moveX) + sqr(moveY));
	moveX = moveX/len;
	moveY = moveY/len;
	
	hsp = moveX * flyingSpeed;
	vsp = moveY * flyingSpeed;
	return [hsp, vsp]; 
}