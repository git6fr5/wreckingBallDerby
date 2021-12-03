
//var dir_x = x - other.x; // from them to me
//var dir_y = y - other.y;

//if (abs(dir_x) >= abs(dir_y)) {
//	dir_y = 0;
//}

//if (abs(dir_y) > abs(dir_x)) {
//	dir_x = 0;
//}

//function normalize(val, x, y) { return val / (x*x + y*y); }
//dir_x = normalize(dir_x, dir_x, dir_y);
//dir_y = normalize(dir_y, dir_x, dir_y);

//var mag = dot_product(dir_x, hspeed, dir_y, vspeed);

//hspeed -= 2 * mag * dir_x;
//vspeed -= 2 * mag * dir_y;

hspeed *= -0.1;
vspeed *= -0.1;

//target_x = random_range(0, room_width);
//target_y = random_range(0, room_height);