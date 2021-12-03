
if (!destroy) {
	
	audio_play_sound(sndWreckingBall, 1, 0);
	var prob = random_range(0, 2);
			if (prob < 1) {
				audio_play_sound(sndExplosion, 1, 0);
			}
			else {
				audio_play_sound(sndExplosion2, 1, 0);
			}
	
	destroy = true;
	
	vspeed = objWreckingBall.vspeed;
	hspeed = objWreckingBall.hspeed;
	
	objCamController.shake = true;
	objCamController.ticks = 0;
	objCamController.magnitude = 3 + 7 / hp;

}
