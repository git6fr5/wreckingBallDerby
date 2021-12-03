
function Camera() {
	
	//var camera = camera_get_active();
	//show_debug_message(string(camera));
	
	show_debug_message("Adjusting camera");
	var camera = view_camera[0];
	
	var viewmat = matrix_build_lookat(room_width/2, room_height/2 + 10, -10, room_width/2, room_height/2, 0, 0, 1, 0);
	var projmat = matrix_build_projection_ortho(768, 768, 1.0, 32000.0);
	
	camera_set_view_mat(camera, viewmat);
	camera_set_proj_mat(camera, projmat);
	// camera_apply(camera)
	
}

function Bounds() {
	
	min_x = room_width * (1 - size) / 2;
	max_x = room_width * size + min_x;
	
	min_y = room_height * (1 - size) / 2;
	max_y = room_height * size + min_y;
	
	min_target_x = room_width * (1 - target_size) / 2;
	max_target_x = room_width * target_size + min_x;
	
	min_target_y = room_height * (1 - target_size) / 2;
	max_target_y = room_height * target_size + min_y;
	
}

function SpawnFences() {
	//var width = 30;
	//var width_num = floor((max_x - min_x) / width);
	//for (i = 0; i < width_num; i+= 1) {
	//	var fenceA = instance_create_depth(min_x+i*width,min_y, -min_y, prefab_fence);
	//	fenceA.index = 4;
	//	var fenceB = instance_create_depth(min_x+i*width,max_y, -max_y, prefab_fence);
	//	fenceB.index = 0;
	//}
	
	var height = 30;
	var height_num = floor((max_y - min_y) / height);
	for (i = 0; i < height_num; i+= 1) {
		var fenceC = instance_create_depth(min_x - 32, min_y+i*height, -min_y+i*height, prefab_fence);
		fenceC.index = 6;
		var fenceD = instance_create_depth(max_x, min_y+i*height, -min_y+i*height, prefab_fence);
		fenceD.index = 2;
	}
	
}

function SetTargets(num){
	for (i = 0; i < num; i += 1) {
		targets_x[i] = random_range(min_target_x, max_target_x);
		targets_y[i] = random_range(min_target_y, max_target_y);
	}
}

function SpawnCars(num) {
	
	for	(i = 0; i < num; i += 1){
		
		var pos_x = random_range(min_x, max_x);
		var pos_y = random_range(min_y, max_y);
		
		cars[i] = instance_create_depth(pos_x, pos_y, 0, prefabCar);		
	}
	
}

// Camera();
// view_angle[0] = 45;
Bounds();
SetTargets(number_of_targets);
SpawnCars(number_of_cars);
// SpawnFences();