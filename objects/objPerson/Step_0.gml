
function AI(dt, direction_x, direction_y) {
	
	ticks += dt;
	if (ticks > think_interval) {
		Target();
		ticks = 0;
	}
	
}

function Target() {
	
	var index = floor(random_range(0, objAudience.number_of_targets));
	
	
	var box = objAudience.target_sets[box_index];
	// show_debug_message("here");
	var __ = objAudience.target_sets[box_index][0];
	// show_debug_message("here");
	
	target_x = random_range(0, room_width); //objAudience.target_sets[box_index][index][0];	
	target_y = random_range(0, room_height); //objAudience.target_sets[box_index][index][1];
	
}

function Accelerate(dt) {
	
	var delta_x =  target_x - x;
	var delta_y = target_y - y;
	
	var denom = abs(delta_x) + abs(delta_y);
	var dir_x = delta_x / denom;
	var dir_y = delta_y / denom;
	
	vspeed += dir_y * acceleration * dt;
	hspeed += dir_x * acceleration * dt;
	
}

function Resistance(dt) {
	
	vspeed = (1-(resistance * dt)) * vspeed;
	hspeed = (1-(resistance * dt)) * hspeed;
	
}

function Collision(dt) {
	
	// collision_circle( x, y, 8, objCar, true, true );
	
}


function Bounds() {
	
	// x = clamp(x, objAudience.boxes[box_index][0], objAudience.boxes[box_index][1]);
	// y = clamp(y, objAudience.boxes[box_index][2], objAudience.boxes[box_index][3]);
	
	x = clamp(x, 0, room_width);
	y = clamp(y, 0, room_height);
	
	//eeeeh
	vspeed = clamp(vspeed, -max_speed, max_speed);
	hspeed = clamp(hspeed, -max_speed, max_speed);
	
}

function Destroy(dt) {
	
	// vspeed = 0; hspeed = 0;
	
	if (destroy_ticks == 0) {
		
		blood_particle = instance_create_depth(x, y, -1, prefab_particle);
		blood_particle.sprite_index = sprBloodSplatter;
		blood_particle.destroy_on_end = false;
		blood_particle.animate = false;
		blood_particle.follow = noone;
	}
	
	destroy_ticks += dt;
	if (destroy_ticks > destroy_delay) {
		instance_destroy();
	}

}

function MakeNoise(dt) {
	
	
	if (playing_sound) {
		sound_ticks += dt;
		if (sound_ticks > sound_interval) {
			playing_sound = false;
			sound_ticks = 0;
		}
		return;
	}
	
	sqr_distance = (x - objShadow.x) * (x - objShadow.x) + (y - objShadow.y) *  (y - objShadow.y);
	if (power(sqr_distance, 0.5) > 200) {
		return;
	}
	
	else {
		
		if (random_range(0, 0.99) < 0.001) {
			var prob = random_range(0, 2);
			if (prob < 1) {
				audio_play_sound(sndPerson1, 0, 0);
			}
			else if (prob < 2) {
				audio_play_sound(sndPerson2, 0, 0);
			}
			playing_sound = true;
		}
		
	}
	
	
}


var dt = delta_time / 1000000;
depth = -y;

if (!destroy) {
	
	AI(dt);
	Accelerate(dt);
	Resistance(dt);

	Collision(dt)
	MakeNoise(dt);

	// move_bounce_solid(true);

	Bounds();

}

else {
	
	Destroy(dt);
	
}
// Debug()