/// @description Health Bar

draw_sprite(sHealthBarBackground, 0, healthbar_x, healthbar_y);
draw_sprite_stretched(sHealthBar, 0, healthbar_x, healthbar_y, (global.playerHP/global.playerMaxHP)*healthbar_width, healthbar_height);
draw_sprite(sHealthBarBorder, 0, healthbar_x,healthbar_y);
surface_resize(application_surface, RESOLUTION_W, RESOLUTION_H);
