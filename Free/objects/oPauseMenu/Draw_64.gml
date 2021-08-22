/// @description Draw menu
// You can write your code in this editor

draw_set_font(menu_font);
draw_set_halign(hAlign);
draw_set_valign(vAlign);

for(var i = 0; i <menu_items; i++){
	var offset = 2;
	var txt = menu[i];
	if (menu_cursor == i){
		txt = string_insert("> ", txt, 0);
		txt = string_insert(" <", txt,string_length(txt)+1);
		var col = c_white;
	}
	else{
		var col = c_grey;
	}
	if(menu[i] = "Double Jump"){
		if(global.hasDoubleJump == 1){
			var col = c_white;
		}
		else{
			var col = c_grey;
		}
	}
	if(menu[i] = "Dash"){
		if(global.hasDash == 1){
			var col = c_white;
		}
		else{
			var col = c_grey;
		}
	}
	if(menu[i] = "Wall Grab"){
		if(global.hasWallGrab == 1){
			var col = c_white;
		}
		else{
			var col = c_grey;
		}
	}
	var xx = menu_x;
	var yy = menu_y - (menu_itemHeight * (i*3.5));
	draw_set_color(c_black);
	draw_text(xx-offset, yy, txt);
	draw_text(xx+offset, yy, txt);
	draw_text(xx, yy+offset, txt);
	draw_text(xx,yy-offset,txt);
	draw_set_color(col);
	draw_text(xx,yy,txt);
}