var dt = delta_time / 1000000;

game_score = objArena.number_of_cars - instance_number(objCar);
bonus_score = objAudience.number_of_people - instance_number(objPerson);

if (game_score > 0) {
	game_time += dt
	show_debug_message("SCORE: " + string(game_score) + ", TIME: " + string(game_time) + ", BONUS: " + string(bonus_score));
}

if (game_time >= 60) {
	show_debug_message("LOST GAME");
	room_restart();
	// GOTO MENU
	// room_goto(rm_level1); break;
}