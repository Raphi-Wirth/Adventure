/// @description Control menu
// You can write your code in this editor

//Item ease in
menu_x += (menu_x_target - menu_x) /menu_speed;
//Check if there is a save file 

//Keyboard controls
if(menu_control){
	if(keyboard_check_pressed(vk_up)){
		menu_cursor ++;
		if(menu_cursor >= menu_items) menu_cursor = 0;
	}
	if(keyboard_check_pressed(vk_down)){
		menu_cursor --;
		if(menu_cursor < 0) menu_cursor = menu_items -1;
	}
	if(keyboard_check_pressed(vk_enter)){
		menu_x_target = gui_width + 300;
		menu_committed = menu[menu_cursor];
		menu_control = false;
	}
}


if(menu_x > gui_width+150 and menu_committed != -1 and transitionHappening == 0){
	switch (menu_committed){
		case "Play":
			for (var i = 0; i < array_length(continueMenuText); i++){
				menu[i] = continueMenuText[i];
			}
			menu_committed = 0;
			menu_control = true;
			menu_x_target = gui_width - gui_margin;
			menu_items = array_length(menu);
			menu_cursor = array_length(continueMenuText) - 1;
			break;
		case "Quit": game_end(); break;
		case "Save 1": global.gameSaveSlot = 0; LoadGame(0); instance_destroy(); break;
		case "Save 2": global.gameSaveSlot = 1;LoadGame(1); instance_destroy(); break;
		case "Save 3": global.gameSaveSlot = 2; LoadGame(2); instance_destroy(); break;
	}
}