
function ScreenShake() {
		
	view_object[0] = noone;
	var view_x = camera_get_view_x(view_camera[0]);
	var view_y = camera_get_view_y(view_camera[0]);
		
	camera_set_view_pos(view_camera[0], view_x + random_range(-magnitude, magnitude), view_y + + random_range(-magnitude, magnitude));

}

if (follow != noone) {
	view_object[0] = follow;
}
else {
	camera_set_view_pos(view_camera[0], 0, 0);
}

var dt = delta_time / 1000000;

if (shake) {
	ScreenShake();
	ticks += dt
	if (ticks > shake_duration) {
		shake = false;
		ticks = 0;
	}
}



