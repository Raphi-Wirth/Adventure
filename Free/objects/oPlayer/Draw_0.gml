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
	draw_sprite_ext(
		sprite_index,
		image_index,
		floor(x),
		floor(y),
		image_xscale,
		image_yscale,
		image_angle,
		image_blend,
		image_alpha
	)
	if(shader_current() != -1) shader_reset();
}
