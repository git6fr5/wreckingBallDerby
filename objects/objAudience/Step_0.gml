
function CycleTargets(num) {
	target_sets = [right_box_targets, top_box_targets, left_box_targets, bottom_box_targets];
	
	for (n = 0; n < 4; n += 1) {
		var target;
		target[0] = 0; target[1] = 0;
		var box = boxes[n];
		for (i = 0; i < num; i += 1) {
			target[0] = random_range(box[0], box[1]);
			target[1] = random_range(box[2], box[3]);
			target_sets[n][i] = target;
		}
	}
}

function AI(dt) {
	
	ticks += dt;
	if (ticks > think_interval) {
		CycleTargets(number_of_targets);
		ticks = 0;
	}
	
}

var dt = delta_time / 1000000;

AI(dt);