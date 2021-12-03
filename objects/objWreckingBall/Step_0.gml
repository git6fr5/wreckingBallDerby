
function Reaction(dt) {
	
	origin_x = objCrane.x;
	origin_y = objCrane.y + objCrane.length;
	
	delta_y = y - origin_y;
	delta_x = x - origin_x;
	
	vspeed -= PERSPECTIVE_Y * central_tension * delta_y * dt
	hspeed -= PERSPECTIVE_X * central_tension * delta_x * dt
	
}

function Resistance(dt) {
	
	vspeed = (1-(PERSPECTIVE_Y * resistance * dt)) * vspeed;
	hspeed = (1-(PERSPECTIVE_X * resistance * dt)) * hspeed;
	
}

function hyponetuse(a, b) { return power(a * a + b * b, 0.5); }


function Length(dt) {
	
	//if (hypotenuse(delta_x, delta_y) > objCrane.max_length) {
	var hyp = hyponetuse(delta_x, delta_y);
	var diff = hyp - objCrane.max_length;
	vspeed -= length_tension * diff * (delta_y / hyp) * dt;
	hspeed -= length_tension * diff * (delta_x / hyp) * dt;
	
}

function Bounds() {
	
	if (vspeed == 0 && hspeed == 0) {
		return;
	}
	
	vspeed = clamp(vspeed, -PERSPECTIVE_Y * max_speed, PERSPECTIVE_Y * max_speed);
	hspeed = clamp(hspeed, -PERSPECTIVE_X * max_speed, PERSPECTIVE_X * max_speed);
	
}

function Debug() {
	
	var messageA = "Delta Position: " + string(delta_x) + ", " + string(delta_y);
	var messageB = "Velocity: " + string(hspeed) + ", " + string(vspeed);

	show_debug_message(messageA);
	show_debug_message(messageB);
	
}

function Collision(dt) {
	
	if (abs(vspeed) + abs(hspeed) < destroy_threshold) {
		return;
	}
	
	var car_list = ds_list_create();
	collision_circle_list(x, y, 16, objCar, true, true, car_list, true);
	
	for (i = 0; i < ds_list_size(car_list); i += 1) {
		var car = car_list[| i]
		if (!car.destroy) {
			car.destroy = true;
			car.vspeed = vspeed; car.hspeed = hspeed;
			objCamController.shake = true;
			objCamController.ticks = 0;
			objCamController.magnitude = 3 + 7 / car.hp;
		}
	}
	
	var person_list = ds_list_create();
	collision_circle_list(x, y, 16, objPerson, true, true, person_list, true);
	
	for (i = 0; i < ds_list_size(person_list); i += 1) {
		var person = person_list[| i]
		if (!person.destroy) {
			person.destroy = true;
			person.vspeed = vspeed; person.hspeed = hspeed;
		}
	}

	
}



var dt = delta_time / 1000000;
depth = -y;

Reaction(dt);
Resistance(dt);
Length(dt);

Collision(dt)

// move_bounce_solid(true);

Bounds(dt);

// Debug();