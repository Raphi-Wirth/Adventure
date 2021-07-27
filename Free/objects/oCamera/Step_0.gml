/// @description Insert description here
// You can write your code in this editor

if(follow != noone){
	xTo = follow.x;
	yTo = follow.y;
}
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
	y = follow.y;
}


x = clamp(x, view_w_half, room_width - view_w_half);
y = clamp(y,view_h_half, room_height - view_h_half);


//Screenshake
x += random_range(-shakeRemain, shakeRemain);
y += random_range(-shakeRemain, shakeRemain);

shakeRemain = max(0, shakeRemain - ((1/shakeLength) * shakeMagnitude));

camera_set_view_pos(camera, floor(x - view_w_half) , floor(y - view_h_half));