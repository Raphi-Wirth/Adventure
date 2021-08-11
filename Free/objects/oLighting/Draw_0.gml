/// @description Insert description here
// You can write your code in this editor
if !surface_exists(surf)
    {
    var _cw = camera_get_view_width(view_camera[0]);
    var _ch = camera_get_view_height(view_camera[0]);
    surf = surface_create(_cw, _ch);
    surface_set_target(surf);
    draw_set_colour(c_black);
    draw_set_alpha(0);
    draw_rectangle(0, 0, _cw, _cw, false);
    surface_reset_target();
    }
else
{
if (surface_exists(surf)) {
var _cw = camera_get_view_width(view_camera[0]);
var _ch = camera_get_view_height(view_camera[0]);
var _cx = camera_get_view_x(view_camera[0]);
var _cy = camera_get_view_y(view_camera[0]);
surface_set_target(surf);
draw_set_color(c_black);
draw_set_alpha(global.roomDarkness);
draw_rectangle(0, 0, _cw, _ch, 0);
gpu_set_blendmode(bm_subtract);
with (oLightParent)
{
	var _sw = sprite_width / 2;
	var _sh = sprite_height / 2;
	switch(object_index){
	case oPlayer:
		draw_sprite_ext(sLight, 0, x - _cx, y - _sh - _cy, global.lightRange, global.lightRange, 0, c_white, global.lightIntensity);            
		break;
	
	case oTutorialGuy:
		with(oTutorialGuy){
			if(sprite_index == sTutorialGuySmoke and image_index >= 5 and image_index <=10){
				var _intensity = 1 - abs(7.5 - image_index)/2.5
				draw_sprite_ext(sLight, 0, x - _cx + 20, y - _sh - 20 - _cy, 0.5, 0.5, 0, c_red, _intensity);
			}
		}
	case oLight:
		with(oLight){
			draw_sprite_ext(sLight, 0, x - _cx, y - _sh - _cy, 3, 5, 0, c_white, random_range(0.75,0.85));
		}
	}
}
gpu_set_blendmode(bm_normal);
draw_set_alpha(1);
surface_reset_target();
draw_surface(surf, _cx, _cy);
}
}