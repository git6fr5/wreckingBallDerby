
function ScreenShake() {
	
	// camera_set_view_target(view_camera[0], noone);
	
	if (follow != noone){
		// camera_set_view_angle(view_camera[0], random_range(-magnitude / 5, magnitude / 5));
		min_w = 0.975;
		min_h = 0.975
	}
	else {
		
	var view_x = camera_get_view_x(view_camera[0]);
	var view_y = camera_get_view_y(view_camera[0]);
		
	camera_set_view_pos(view_camera[0], view_x + random_range(-magnitude * scale_x, magnitude * scale_x), view_y + random_range(-magnitude * scale_y, magnitude * scale_y));
	
	}
}

if (follow != noone) {
	camera_set_view_target(view_camera[0], follow);
	// camera_set_view_pos(view_camera[0], follow.x - view_wport[0], follow.y - view_hport[0]);
	// camera_set_view_angle(view_camera[0], 0);
	camera_set_view_size(view_camera[0], w * random_range(min_w, 1), h * random_range(min_h, 1));
	min_w = 0.995;
	min_h = 0.995
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

// camera_set_view_size(view_camera[0], view_wport[0], view_hport[0]);



