
function Input(dt) {
	
	delta_x = 0;
	delta_y = 0;

	if (keyboard_check(vk_up)) {
		delta_y = -PERSPECTIVE_Y * move_speed * dt;
	}
	else if (keyboard_check(vk_down)) {
		delta_y = PERSPECTIVE_Y * move_speed * dt;
	}

	if (keyboard_check(vk_right)) {
		delta_x = PERSPECTIVE_X * move_speed * dt;
	}
	else if (keyboard_check(vk_left)) {
		delta_x = -PERSPECTIVE_X * move_speed * dt;
	}
	
	y+=delta_y;
	x+=delta_x;
	//x = mouse_x;
	//y = mouse_y;
	
	
	
	
}

function Reaction(dt) {

	//delta_y = y - objWreckingBall.y;
	//delta_x = x - objWreckingBall.x;
	
	//if (abs(delta_y) > max_length){
	//	y -= PERSPECTIVE_Y * tension * delta_y * dt
	//}
	//if (abs(delta_x) > max_length){
	//	x -= PERSPECTIVE_X * tension * delta_x * dt
	//}

}

function Input2(dt) {

    var acceleration = 20;

    if (keyboard_check(vk_up) || keyboard_check(ord("W"))) {
        vspeed -= acceleration * dt;
    }
    else if (keyboard_check(vk_down) || keyboard_check(ord("S"))) {
        vspeed += acceleration  * dt;
    }

    if (keyboard_check(vk_right) || keyboard_check(ord("D"))) {
        hspeed += acceleration  * dt;
    }
    else if (keyboard_check(vk_left) || keyboard_check(ord("A"))) {
        hspeed -= acceleration  * dt;
    }

    delta_y = vspeed;
    delta_x = hspeed;
    //x = mouse_x;
    //y = mouse_y;

}

function Draw() {
	
}

function Bounds(dt) {
    // Make sure I can't move out of the screen.
    x = clamp(x, objArena.min_x, objArena.max_x);
    y = clamp(y, objArena.min_y - length, objArena.max_y - length);

    var s = 5;
    vspeed = clamp(vspeed, -s, s);
    hspeed = clamp(hspeed, -s, s);

    vspeed *= 0.975;
    hspeed *= 0.975;

}

var dt = delta_time / 1000000;

Input2(dt);
Reaction(dt);
Bounds(dt);
// Draw();