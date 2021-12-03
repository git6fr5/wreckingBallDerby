var dt = delta_time / 1000000;

game_score = objArena.number_of_cars - instance_number(objCar);
// bonus_score =;

if (game_score  <= 50) {
    game_time += dt
    show_debug_message("SCORE: " + string(game_score) + ", TIME: " + string(game_time) + ", PEOPLE DEAD: " + string(people_killed));
}

if (game_time >= 60) {
	audio_stop_sound(sngDerby);
	audio_stop_sound(sndHelicopter);
    show_debug_message("LOST GAME");
	score = game_score;
	var rm = asset_get_index("end_room");
	room_goto(rm);
    // room_goto(rm_level1); break;
}

var offset = 0;

if (game_time > 1 - offset && !music_playing) {
	music_playing = true;
	audio_play_sound(sngDerby, 1, 0);
}

if (game_time > 3 - offset && !alarm_start) {
	alarm_start = true;
	audio_play_sound(sndAlarm, 1, 0);
}

if (game_time > 50 - offset && !alarm_played_10) {
	alarm_played_10 = true;
	audio_play_sound(sndAlarm, 1, 0);
}

if (game_time > 57 - offset && !alarm_played_3) {
	alarm_played_3 = true;
	audio_play_sound(sndAlarm, 1, 0);
}

if (game_time > 58 - offset && !alarm_played_2) {
	alarm_played_2 = true;
	audio_play_sound(sndAlarm, 1, 0);
}

if (game_time > 59 - offset && !alarm_played_1) {
	alarm_played_1 = true;
	audio_play_sound(sndEnd, 1, 0);
}