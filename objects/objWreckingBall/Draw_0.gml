
function Frame() {
	
	var offset_increment = 75 / 4;
	var offset = power(power(delta_x, 2) + power(delta_y, 2), 0.5);
	var sprite_sheets = [sprWreckingBall_0, sprWreckingBall_1, sprWreckingBall_2, sprWreckingBall_3];
	
	sprite_index = sprite_sheets[3];
	for (i = 0; i < 4; i += 1) {
		if (clamp(offset, offset_increment * i, offset_increment * (i+1)) == offset){
			sprite_index = sprite_sheets[i];
		}
	}
	
	
	// at angle = 0 -> 18
	// at angle = pi / 2 -> 12
	// at angle = pi -> 6
	// at angle = 3 pi / 2 -> 4
	
	var quadrant = 0;
	var adj = delta_x;
	var opp = -delta_y;
	
	if (adj < 0 && opp > 0) {
		quadrant = 1;
	}
	else if (adj < 0 && opp <= 0) {
		quadrant = 2;
	}
	else if (adj > 0 && opp < 0) {
		quadrant = 3;
	}
	
	var angle = 3 * pi / 2 + pi / 4;
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
    else if (opp > 0) {
        angle = pi / 2;
    }
    else if (opp < 0) {
        angle = 3 * pi / 2;
    }
	
	// show_debug_message("QUAD: " + string(quadrant) + "OPP: " + string(opp) + ", ADJ: " + string(adj) + ", ANGLE:" + string(angle * 180 / pi))
	var index = floor(16 - 16 * angle / (2 * pi)) - 6;
	if (index < 0) {
		index = 16 + index;
	}
	image_index = index;
		
}

function Scale() {
	image_xscale = 1 + power(SCALE_BASE, SCALE_FACTOR * delta_y);
	image_yscale = 1 + power(SCALE_BASE, SCALE_FACTOR * delta_y);
}

Frame();
Scale();
draw_self();