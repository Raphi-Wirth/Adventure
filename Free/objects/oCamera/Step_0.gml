  /// @description Insert description here
// You can write your code in this editor

if(instance_exists(follow)){
	xTo = follow.x;
	yTo = follow.y - sprite_get_height(sIdle)/2;


	if(abs((xTo-x)/10) > 0.05){
		x += (xTo-x)/10;
	}
	else{
		x = follow.x;
	}
	if(abs((yTo-y)/10) > 0.05){
		y += (yTo-y)/10;
	}
	else{
		y = follow.y - sprite_get_height(sIdle)/2;
	}


	x = clamp(x, view_w_half, room_width - view_w_half);
	y = clamp(y,view_h_half, room_height - view_h_half);

	//Screenshake
	x += random_range(-shakeRemain, shakeRemain);
	y += random_range(-shakeRemain, shakeRemain);

	shakeRemain = max(0, shakeRemain - ((1/shakeLength) * shakeMagnitude));

	camera_set_view_pos(camera, floor(x - view_w_half) , floor(y - view_h_half));

	if (layer_exists("Mountains")){
		layer_x("Mountains",x/1.5);
		layer_y("Mountains", room_height - 500 - (room_height - y)/1.2);
	}

	if (layer_exists("Forest")){
		layer_x("Forest", x/3 - 600);
	}

	if(layer_exists("Foreground")){
		layer_x("Foreground", x/5);
	}
}
