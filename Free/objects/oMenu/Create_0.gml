/// @description GUI/Vars/Menu setup
// You can write your code in this editor

gui_width = display_get_gui_width();
gui_height = display_get_gui_height();
gui_margin = 64;

menu_x = gui_width + 200;
menu_y = gui_height - gui_margin;
menu_x_target = gui_width -gui_margin;
menu_speed = 25;
menu_font = fMenu;
menu_itemHeight = font_get_size(fText);
menu_committed = -1;
menu_control = true;
transitionHappening = 0;

maxSaveSlots = 3;

menu[1] = "Play";
menu[0] = "Quit";

menu_items = array_length_1d(menu);
menu_cursor = 1;

continueMenuText = ["Save 3", "Save 2", "Save 1","New Game"];
mainMenuText = ["Quit", "Play"];