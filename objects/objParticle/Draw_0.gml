
var alpha = 0.75;
var scale = 2;
if (!animate) {
	alpha = 1;
	image_index = index;
	if (ticks > duration - fade_duration) {
		alpha *= (duration - ticks) / fade_duration;
	}
	scale = 3;
}

if (sprite_index == sprScorchedEarth){
	alpha = 0.2;
}
	
draw_sprite_ext(sprite_index, image_index, x, y, scale, scale, 0, c_white, alpha);