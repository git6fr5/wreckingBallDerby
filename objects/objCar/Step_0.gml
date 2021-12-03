
function AI(dt, direction_x, direction_y) {
	
	ticks += dt;
	if (ticks > think_interval) {	
		
		Target();
		ticks = 0;
	}
	
	if (proximity_check(target_x, target_y, target_threshold)) {
		Target();
		ticks = 0;
	}
	
	if (hp < 3 && random_range(0, 0.99) < 0.05 / hp) {
		
		var smoke_particle = instance_create_depth(x, y, -y, prefab_particle);
		smoke_particle.sprite_index = sprSmoke;
		smoke_particle.destroy_on_end = true;
		smoke_particle.animate = true;
		smoke_particle.follow = noone;
		smoke_particle.follow_offset_x = random_range(-5, 5);
		smoke_particle.follow_offset_y = random_range(-5, 5);
		
	}
	
	var local_target;
	local_target[0] = target_x;
	local_target[1] = target_y;
	//for	(i = 0; i < objArena.number_of_cars; i += 1) {
		
	//	var car = objArena.cars[i];
	//	if (instance_exists(car) && ProximityCheck(car.x, car.y, 50)) {
	//		local_target[0] -= (x - car.x);
	//		local_target[1] -= (y - car.y);
	//	}
		
	//}
	
	if (proximity_check(objCrane.x, objCrane.y + objCrane.max_length, 400)) {
		
		local_target[0] = car.x - 100 * (objCrane.x - car.x);
		local_target[1] = car.y - 100 * (objCrane.y + objCrane.max_length - car.y);
		
	}
	
	return local_target;
	
}

function proximity_check(pos_x, pos_y, threshold) {
	
	var proximity_x = (abs(pos_x) > abs(x) + PERSPECTIVE_X * threshold) && (abs(pos_x) < abs(x) - PERSPECTIVE_X * threshold)
	var proximity_y = (abs(pos_y) > abs(x) + PERSPECTIVE_Y * threshold) && (abs(pos_y) < abs(x) - PERSPECTIVE_Y * threshold)

	return (proximity_x && proximity_y);
}

function Target() {
	
	//var index = floor(random_range(0, objArena.number_of_targets));
	//target_x = objArena.targets_x[index];	
	//target_y = objArena.targets_y[index];
	
	target_x = random_range(objArena.min_target_x, objArena.max_target_x);
	target_y = random_range(objArena.min_target_y, objArena.max_target_y);
	
}

function Accelerate(dt) {
	
	var delta_x =  local_target[0] - x;
	var delta_y = local_target[1] - y;
	
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
	
	//var range = 2;
	//var other_car = collision_circle( x, y, 32, objCar, true, true ) 
	//if (other_car != noone) {
	//	x += random_range(-range, range);
	//	y += random_range(-range, range);
	//	hspeed *= 0.75;
	//	vspeed *= 0.75;
	//}
	
	
}


function Bounds() {
	
	x = clamp(x, objArena.min_x, objArena.max_x);
	y = clamp(y, objArena.min_y, objArena.max_y);
	
	//eeeeh
	vspeed = clamp(vspeed, -max_speed, max_speed);
	hspeed = clamp(hspeed, -max_speed, max_speed);
	
	speed = clamp(speed, min_speed, max_speed);
	
}

function Destroy(dt) {
	
	if (destroy_ticks == 0) {
		hp -= 1;
		fire_particle = instance_create_depth(x, y, -y, prefab_particle);
		fire_particle.sprite_index = sprFire;
		fire_particle.destroy_on_end = true;
		fire_particle.animate = true;
		fire_particle.follow = noone;
		
		var scorch_particle = instance_create_depth(x, y, -y, prefab_particle);
		scorch_particle.sprite_index = sprScorchedEarth;
		scorch_particle.destroy_on_end = false;
		scorch_particle.animate = false;
		scorch_particle.follow = noone;
		
		var particle_index = noone;
		if (hp == 2) {
			particle_index = sprSmallFire;
		}
		if (hp == 1) {
			particle_index = sprBigFire;
		}
		if (hp == 0) {
			particle_index = sprMassiveFire;
		}
		
		for (i = 0; i < 3; i += 1) {
			if (instance_exists(hp_particle[i])) {
				instance_destroy(hp_particle[i]);
			}
		}
		
		if (particle_index != noone) {
			
			for (i = 0; i < 3; i += 1) {
				hp_particle[i] = instance_create_depth(x, y, -1, prefab_particle);
				hp_particle[i].sprite_index = particle_index;
				hp_particle[i].destroy_on_end = false;
				hp_particle[i].animate = true;
				hp_particle[i].follow = self;
				hp_particle[i].follow_offset_x = random_range(-5, 5);
				hp_particle[i].follow_offset_y = random_range(-5, 5);
			
			}
			
		}
		
	}
	
	if (random_range(0, 0.99) < 0.05) {
		
		var smoke_particle = instance_create_depth(x, y, -y, prefab_particle);
		smoke_particle.sprite_index = sprSmoke;
		smoke_particle.destroy_on_end = true;
		smoke_particle.animate = true;
		smoke_particle.follow = self;
		
		//smoke_particle.follow = self;
		//smoke_particle.follow_offset_x = random_range(-5, 5);
		//smoke_particle.follow_offset_y = random_range(-5, 5);
		
		//var trail_particle = instance_create_depth(x, y, -y, prefab_particle);
		//trail_particle.sprite_index = sprScorchedEarth;
		//trail_particle.destroy_on_end = false;
		//trail_particle.animate = false;
		//trail_particle.follow = noone;
		
	}
	
	// fire_particle.x
	// vspeed = 0; hspeed = 0;
	destroy_ticks += dt;
	if (destroy_ticks > destroy_delay) {
		if (hp <= 0) {
			
			for (i = 0; i < 3; i += 1) {
				if (instance_exists(hp_particle[i])) {
					instance_destroy(hp_particle[i]);
				}
			}
			
			fire_particle = instance_create_depth(x, y, -y, prefab_particle);
			fire_particle.sprite_index = sprFire;
			fire_particle.destroy_on_end = true;
			fire_particle.animate = true;
			fire_particle.follow = noone;
			
			objCamController.shake = true;
			objCamController.ticks = 0;
			objCamController.magnitude = 10;
		
			// instance_destroy(shadow);
			var prob = random_range(0, 2);
			if (prob < 1) {
				audio_play_sound(sndExplosion, 1, 0);
			}
			else {
				audio_play_sound(sndExplosion2, 1, 0);
			}
			instance_destroy();
		}
		else {
			destroy = false;
			destroy_ticks = 0;
		}
	}

}

function Debug() {
	
	var messageA = "Target: " + string(target_x) + ", " + string(target_y);
	var messageB = "Ticks: " + string(ticks);
	
	show_debug_message(messageA);
	show_debug_message(messageB);
	
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
		
		if (random_range(0, 0.99) < 0.01) {
			var prob = random_range(0, 3);
			if (prob < 1) {
				audio_play_sound(sndCar1, 0, 0);
			}
			else if (prob < 2) {
				audio_play_sound(sndCar2, 0, 0);
			}
			else {
				audio_play_sound(sndCar3, 0, 0);
			}
			playing_sound = true;
		}
		
	}
	
	
}

var dt = delta_time / 1000000;
depth = -y;

if (!destroy) {

	local_target = AI(dt);
	Accelerate(dt);
	Resistance(dt);

	Collision(dt)
	
	// MakeNoise(dt);
	// move_bounce_solid(true);
	
}
else {
	Destroy(dt);
}

Bounds();



// Debug()