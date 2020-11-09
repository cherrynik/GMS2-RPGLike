function player_movement(_collision) {
/* Каждый кадр переменные пересоздаются 
 * для проверки статуса нажатой клавиши
 */
	var _left = keyboard_check(vk_left);
	var _right = keyboard_check(vk_right);
	var _up = keyboard_check(vk_up);
	var _down = keyboard_check(vk_down);

	// Узнаём векторное направление движения игрока
	HORIZONTAL = _right - _left;
	VERTICAL = _down - _up;

	if (HORIZONTAL != 0 || VERTICAL != 0) {
		// Выравниваем скорость во всех направлениях
		var _dir = point_direction(0, 0, HORIZONTAL, VERTICAL)
		var _xFix = lengthdir_x(global.Player.defaultSpeed, _dir)
		var _yFix = lengthdir_y(global.Player.defaultSpeed, _dir)
		
		// Запомнить направление
		oPlayer.Direction.coords = [_xFix, _yFix]

		// Вне зависимости от количества кадров, будет всегда одна скорость
		if (place_empty(x + _xFix, y + _yFix, _collision)) {
			x += _xFix * get_delta_time()
			y += _yFix * get_delta_time()
		}
	}
}