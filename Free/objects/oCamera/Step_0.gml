/// @description Insert description here
// You can write your code in this editor

if(follow != noone){
	xTo = follow.x;
	yTo = follow.y;
}
x += (xTo-x)/10;
y += (yTo-y)/10;

x = clamp(x, 500, room_width - 500);
y = clamp(y, 300, room_height - 300);
var vm = matrix_build_lookat(x,y,-10,x,y,0,0,1,0);
camera_set_view_mat(camera,vm);