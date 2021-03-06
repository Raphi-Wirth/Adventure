/// @description Insert description here
// You can write your code in this editor
if(!global.gamePaused){
	if(bounceCount != 0){
		bounce += (pi*bounceSpeed);
		if(bounce>pi){
			bounce -= pi;
			bounceHeight *= 0.6;
			bounceCount --;
		}
		y = initY - abs(sin(bounce)) * bounceHeight;
	}
	//Deteriorate
	deteriorate++;
	if (deteriorate > deteriorateAfter){
		image_alpha -= 1/deteriorateTime;
		if (image_alpha <= 0){
			instance_destroy();
		}
	}
	//Friction
	Gravity();
	vsp = min(maxFallSpeed, vsp);
	x += lengthdir_x(speed, direction);
	if (tilemap_get_at_pixel(collisionMap, x, y+vsp) > 0){
		while(!tilemap_get_at_pixel(collisionMap, x, y+sign(vsp))){
			y += sign(vsp);
		}
		vsp = 0;
	}
	if (tilemap_get_at_pixel(collisionMap, x-2, y) > 0 or tilemap_get_at_pixel(collisionMap,x+2,y)> 0) speed = 0;
	y += vsp;
	speed = max(speed - fric, 0);
}