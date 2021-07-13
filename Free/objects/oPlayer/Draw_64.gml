/// @description Health Bar

draw_sprite_stretched(sHealthBar, 0, healthbar_x, healthbar_y, (currentHP/maxHP)*healthbar_width, healthbar_height);
draw_sprite(sHealthBarBorder, 0, healthbar_x,healthbar_y);