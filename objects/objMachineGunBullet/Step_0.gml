function Lifetime(dt) {
	
	ticks += dt;
	if (ticks > life_time) {
		instance_destroy();
		ticks = 0;
	}
	
}


var dt = delta_time / 1000000;
Lifetime(dt);