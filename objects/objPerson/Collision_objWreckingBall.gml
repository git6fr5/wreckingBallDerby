if (!destroy) {
	
	destroy = true;
	
	var prob = random_range(0, 2);
	if (prob < 1){
		
	audio_play_sound(sndPerson1, 1, 0);
	}
	else {
		audio_play_sound(sndPerson2, 1, 0);
	}
	vspeed = objWreckingBall.vspeed;
	hspeed = objWreckingBall.hspeed;
}

