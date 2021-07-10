// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function Gravity(){
	if(self.object_index == oPlayer){
		if(keyDown and vsp>0){
			fastFall = 1;
		}
		else{
			grv = 0.5;
			fastFall = 0;
		}
		if(fastFall = 1){
			grv = 1.5;
		}
	}
	
	vsp += grv;
}