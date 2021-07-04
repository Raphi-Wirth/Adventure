/// @description Insert description here
// You can write your code in this editor
camera = camera_create();

var vm = matrix_build_lookat(oPlayer.x,oPlayer.y,-10,oPlayer.x,oPlayer.y,0,0,1,0);

var pm = matrix_build_projection_ortho(640,480,1,10000);

camera_set_view_mat(camera,vm);
camera_set_proj_mat(camera,pm);

view_camera[0] = camera;

follow = oPlayer;
xTo = x;
yTo = y;
