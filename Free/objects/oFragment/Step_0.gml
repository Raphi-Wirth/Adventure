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
	
	fric = 0.025;
	if (y<=initY) fric = 0.05; Gravity();
	x += lengthdir_x(speed, direction);
	if (tilemap_get_at_pixel(collisionMap, x, y) > 0) vsp = 0;
	y += vsp;
	speed = max(speed - fric, 0);
}