/// @description Draw textbox
// You can write your code in this editor
funcNineSliceBoxStretched(sTextBoxBg, x1, y1, x2, y2, background);
draw_set_font(fText);
draw_set_halign(fa_left);
draw_set_valign(fa_top);
draw_set_color(c_black);
var _print = string_copy(message,1,textProgress);
var _messageLength = string_length(message);

if(responses[0] != -1 and textProgress >= string_length(message)){
	for (var i = 0; i<array_length_1d(responses); i++) {
		_print += "\n";
		if(i == responseSelected) {
			_print += "> ";
			
		}
		_print += responses[i];
			
		if(i == responseSelected) {
			_print += " <";
		}
	}
}

draw_text_transformed(x1+25, y1+25, _print, 2,2,0);
draw_set_color(c_white);
draw_text_transformed(x1+25, y1+20, _print, 2,2,0);
if(textboxCharSprite != -1){
	draw_rectangle_color(x2-300, y1 - 100, x2 + 8 , y1 + 207, c_red, c_green, c_blue, c_orange, false);
	draw_sprite_ext(
		textboxCharSprite,
		image_index,
		x2 - 296,
		y1 - 96,
		image_xscale,
		image_yscale,
		image_angle,
		image_blend,
		image_alpha
	)
	if(textProgress >= _messageLength and animation_end()){
		image_speed = 0;
		image_index = 0;
	}
	else{
		image_speed = 0.15;
			
	}

}
