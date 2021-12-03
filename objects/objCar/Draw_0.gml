
function Shader() {
	
	shader_set(shCar);
	shader_set_uniform_f(upixelW, texelW);
	shader_set_uniform_f(upixelH, texelH);
	shader_reset();
	
}

function Frame() {

		
	// at angle = 0 -> 18
	// at angle = pi / 2 -> 12
	// at angle = pi -> 6
	// at angle = 3 pi / 2 -> 0
	
	var quadrant = 0;
	var adj = hspeed;
	var opp = -vspeed;
	
	if (adj < 0 && opp > 0) {
		quadrant = 1;
	}
	else if (adj < 0 && opp <= 0) {
		quadrant = 2;
	}
	else if (adj > 0 && opp < 0) {
		quadrant = 3;
	}
	
	var angle = 3 * pi / 2;
	if (adj != 0) {
		var angle = arctan(abs(opp) / abs(adj));
		if (quadrant == 2) {
			angle += pi;
		}
		if (quadrant == 1) {
			angle = pi - angle;
		}
		if (quadrant == 3) {
			angle = 2 * pi - angle;
		}
	}
	
	shadow.angle = angle;
	
	show_debug_message("QUAD: " + string(quadrant) + "OPP: " + string(opp) + ", ADJ: " + string(adj) + ", ANGLE:" + string(angle * 180 / pi))
	var index = floor(24 - 24 * angle / (2 * pi)) - 6;
	if (index < 0) {
		index = 24 + index;
	}
	image_index = index;
	
}

function Scale() {
	
	var delta_y = (y - room_height / 2);

	image_xscale = 1 + power(SCALE_BASE, SCALE_FACTOR * delta_y);
	image_yscale = 1 + power(SCALE_BASE, SCALE_FACTOR * delta_y);

}

if (!destroy) {
	Frame();
	Scale();
}

// draw_sprite(sprCarShadow, 9);
draw_self();
