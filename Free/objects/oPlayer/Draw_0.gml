/// @description Insert description here
// You can write your code in this editor
if(invulnerable != 0 and (invulnerable mod 8<4) == 0 and flash == 0){
	//Skip draw	
}
else{
	if(flash != 0){
		shader_set(flashShader);
		uFlash = shader_get_uniform(flashShader, "flash");
		shader_set_uniform_f(uFlash, flash);
	}
	if(state == PLAYERSTATE.GROUND_ATTACK and bottomSprite != -1){
		show_debug_message("Before swap: " + string(bottomSpriteImageIndex)); 
		draw_sprite_ext(bottomSprite, (bottomSpriteImageIndex + image_index) mod image_number, x,y, image_xscale, image_yscale, image_angle, image_blend, image_alpha);
		draw_sprite_ext(sprite_index, image_index, x,y-50, image_xscale, image_yscale, image_angle, image_blend, image_alpha);
	}
	else{
		draw_sprite_ext(sprite_index, image_index, x,y, image_xscale, image_yscale, image_angle, image_blend, image_alpha);
	}

	if(shader_current() != -1) shader_reset();
}
