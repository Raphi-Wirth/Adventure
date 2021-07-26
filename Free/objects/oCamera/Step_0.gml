/// @description Insert description here
// You can write your code in this editor

if(follow != noone){
	xTo = follow.x;
	yTo = follow.y;
}
x += (xTo-x)/10;
y += (yTo-y)/10;


x = clamp(x, view_w_half, room_width - view_w_half);
y = clamp(y,view_h_half, room_height - view_h_half);


//Screenshake
x += random_range(-shakeRemain, shakeRemain);
y += random_range(-shakeRemain, shakeRemain);

shakeRemain = max(0, shakeRemain - ((1/shakeLength) * shakeMagnitude));

camera_set_view_pos(camera, x - view_w_half , y - view_h_half);