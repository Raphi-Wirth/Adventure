// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function WanderBehaviour(){
	if(abs(target_x - x) < 5){
		var target_x = random_range(x - wanderRange, x + wanderRange);
	}
	MoveTo(target_x);
} 