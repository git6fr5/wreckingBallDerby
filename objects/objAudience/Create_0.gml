
function Bounds() {
	
	left_box[0] = buffer_size;
	left_box[1] = objArena.min_x - buffer_size;
	left_box[2] = objArena.min_y;
	left_box[3] = objArena.max_y;
	
	right_box[0] = objArena.max_x + buffer_size;
	right_box[1] = room_width - buffer_size;
	right_box[2] = objArena.min_y;
	right_box[3] = objArena.max_y;
	
	top_box[0] = objArena.min_x;
	top_box[1] = objArena.max_x;
	top_box[2] = buffer_size;
	top_box[3] = objArena.min_y - buffer_size;
	
	bottom_box[0] = objArena.min_x;
	bottom_box[1] = objArena.max_x;
	bottom_box[2] = objArena.max_y + buffer_size;
	bottom_box[3] = room_height - buffer_size;
	
	boxes = [right_box, top_box, left_box, bottom_box];
	
}

function SetTargets(num){
	
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

function SpawnPeople(num) {
	
	for (n = 0; n < 4; n += 1) {
		
		var box = boxes[n];
		
		for	(i = 0; i < num; i += 1){
			var pos_x = random_range(box[0], box[1]);
			var pos_y = random_range(box[2], box[3]);	
		
			var person = instance_create_depth(pos_x, pos_y, n*num + i, objPerson);
			person.box_index = n;
		}
		
	}
	
}

Bounds();
SetTargets(number_of_targets);
SpawnPeople(number_of_people)