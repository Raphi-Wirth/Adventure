// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function PlayerHorizontalMovement(){
	if(sign(move) != sign(hsp) and abs(hsp)<=maxSpeed){
		hsp = 0;
	}
	if(abs(hsp)< 1 and move == 0){
		hsp = 0;
	}
	else if(move != 0 and abs(hsp)<= maxSpeed){
		hsp += move*walksp;
	}
	else{
		hsp -= sign(hsp);
	}
}