/// @description GUI/Vars/Menu setup
// You can write your code in this editor

gui_width = display_get_gui_width()/2;
gui_height = display_get_gui_height()/1.75;
gui_margin = 32;
hAlign = fa_center;
vAlign = fa_center; 
menu_x = gui_width;
menu_y = gui_height;
menu_x_target = menu_x;
menu_speed = 25;
menu_font = fMenu;
menu_itemHeight = font_get_size(fText);
menu_committed = -1;
menu_control = true;
transitionHappening = 0;
maxSaveSlots = 3;
menu[4] = "Wall Grab";
menu[3] = "Dash";
menu[2] = "Double Jump";
menu[1] = "Quit and Save";
menu[0] = "Resume";

menu_items = array_length_1d(menu);
menu_cursor = 1;

menu_top = menu_y - ((menu_itemHeight *3.5) * menu_items);

continueMenuText = ["Save 3", "Save 2", "Save 1","New Game"];
mainMenuText = ["Quit", "Play"];