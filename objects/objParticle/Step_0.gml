var dt = delta_time / 1000000;

if (!animate) {
	ticks += dt;
	if (ticks > duration) {
		instance_destroy();
	}
}

if (follow != noone) {
	depth = follow.depth - 5;
	x = follow.x + follow_offset_x;
	y = follow.y + follow_offset_y;
	
}
else {
	depth = -y;
}

if (sprite_index == sprScorchedEarth || sprite_index == sprBloodSplatter){
	depth = 0;
}