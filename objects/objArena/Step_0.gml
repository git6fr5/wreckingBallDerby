
function CycleTargets(num) {
	
	for (i = 0; i < num; i += 1) {
		targets_x[i] = random_range(min_target_x, max_target_x);
		targets_y[i] = random_range(min_target_y, max_target_y);
		if (random_range(0, 0.99) < 0.01) {
			// effect_create_below(ef_cloud, targets_x[i], targets_y[i], choose(0, 1, 2), c_gray);
		}
	}
	
}

function AI(dt) {
	
	show_debug_message(instance_number(objCar));
	show_debug_message(instance_number(objCar));

	show_debug_message(instance_number(objCar));
	show_debug_message(instance_number(objCar));
	show_debug_message(instance_number(objCar));

	
	ticks += dt;
	if (ticks > think_interval) {
		CycleTargets(number_of_targets);
		ticks = 0;
	}

}

var dt = delta_time / 1000000;

AI(dt);