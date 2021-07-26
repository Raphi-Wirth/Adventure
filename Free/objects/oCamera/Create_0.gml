/// @description Insert description here
// You can write your code in this editor
camera = view_camera[0];
follow = oPlayer;
view_w_half = camera_get_view_width(camera) * 0.5;
view_h_half = camera_get_view_height(camera) * 0.5;
xTo = x;
yTo = y;

shakeLength = 0;
shakeMagnitude = 0;
shakeRemain = 0;