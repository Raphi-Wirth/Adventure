// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
///@arg x
///@arg y
///@arg [Items] array of items to drop
///@arg DirectionHit
function DropItems(){
	var min_angle = 0
	var max_angle = 180
	if(argument_count>3){
		if(argument3 == 1){
			max_angle = 65
		}
		else if(argument3 == -1){
			max_angle = 180;
			min_angle = 115;
		}
	}
	var _items = array_length_1d(argument2);
	if(_items > 1){
		var _anglePerItem = (max_angle - min_angle)/_items;
		var _angle = random_range(min_angle, max_angle);
		for (var i = 0; i < _items; i++){
			with (instance_create_layer(argument0, argument1, "Instances", argument2[i])){
				direction = _angle;
				speed = (_items * 0.1) + random(2.5);
			}
			_angle += _anglePerItem;
		}
	}
	else{
		instance_create_layer(argument0,argument1, "Instances", argument2[0]);
	}
}