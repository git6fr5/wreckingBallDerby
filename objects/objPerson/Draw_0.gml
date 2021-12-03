
function Scale() {
	
	var base = 1.5
	
	var delta_y = (y - room_height / 2);

	image_xscale = 1.5 + power(SCALE_BASE, SCALE_FACTOR * delta_y);
	image_yscale = 1.5 + power(SCALE_BASE, SCALE_FACTOR * delta_y);

}

function SetFrame() {
	
	var offset = 0;
	if (abs(vspeed) > abs(hspeed)) {
		if (vspeed < 0) {
			offset = 0;
		}
		else {
			offset = 8;
		}
	}
	else {
		if (hspeed < 0) {
			offset = 4;
		}
		else {
			offset = 12;
		}
	}
	
	var index = 0;
	if (abs(vspeed) + abs(hspeed) > 0.2) {
		var frame_rate = 1/8;
		index = (ticks / frame_rate) % 4
	}
	image_index = offset + index;
	// show_debug_message(string(image_index));
	
}

Scale();
SetFrame();
draw_self();
