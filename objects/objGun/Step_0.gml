
function Move() {
	
	if (!instance_exists(car)) {
		instance_destroy();
	}
	
	x = car.x;
	y = car.y + 2;
	
}

function AI(dt) {
	
	ticks += dt;
	if (ticks > fire_interval && random_range(0, 0.99) < 0.02) {
		Fire();
		ticks = 0;
	}
	
}

function Fire() {
	
	if (type == "machine_gun") {
		MachineGun();
	}

}

function MachineGun() {
	
	var bullet = instance_create_depth(x, y, 1, objMachineGunBullet);
	bullet.hspeed = car.hspeed;
	bullet.vspeed = car.vspeed;
	bullet.speed = 10;
	
}


var dt = delta_time / 1000000;
depth = -y;

Move();
AI(dt);


