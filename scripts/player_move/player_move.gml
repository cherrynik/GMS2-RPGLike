function player_move(_collision, _speed) {
/* Каждый кадр переменные пересоздаются
 * для проверки статуса нажатой клавиши
 * (это называется "временные"/"temp" переменные)
 */
	var _left = keyboard_check(vk_left);
	var _right = keyboard_check(vk_right);
	var _up = keyboard_check(vk_up);
	var _down = keyboard_check(vk_down);

	// Узнаём векторное направление движения игрока по осям
	HORIZONTAL = _right - _left;
	VERTICAL = _down - _up;

	if (HORIZONTAL != 0 || VERTICAL != 0) {
		/*
		 * Выравниваем скорость во всех направлениях
		 */
		
		// Задаём направление на векторной плоскости
		var _dir = point_direction(0, 0, HORIZONTAL, VERTICAL)
		// Присваиваем скорость изменения переменной
		var _xFix = lengthdir_x(_speed, _dir)
		var _yFix = lengthdir_y(_speed, _dir)
		
		/*
		 * Выровняли
		 */

		// Если направление движения не предвидит коллизий
		if (place_free(x + _xFix, y + _yFix)) {
			// Перемещать игрока
			x += _xFix * get_delta_time() // Вне зависимости от количества кадров, будет всегда одна скорость
			y += _yFix * get_delta_time()
		} else { // В случае иначе...
			// Декларация переменных
			var _sweepInterval = 1 // Интервал проверки углов, в арифметической прогрессии - это d
			var _maxAngle = 90 // Максимальный угол "обтекания" угла/стены
			
			// Прогнать направление под текущим углом...
			for (var _angle = _sweepInterval; _angle < _maxAngle; _angle += _sweepInterval) {
				// В две стороны (с помощью switcher'а)
				for (var _switcher = -1; _switcher <= 1; _switcher += 2) {  
					/*
					 * Текущее направление на векторной плоскости
					 * примерить под текущим проверяемым углом
					 */
          var _angleCheck = _dir + _angle * _switcher
					/*
					 * Присваиваем скорость изменения переменной
					 * в направлении под текущим углом
					 * "замедленной", по умолчанию
					 */
          _xFix = lengthdir_x(_speed / global.Player.slowBy, _angleCheck)
          _yFix = lengthdir_y(_speed / global.Player.slowBy, _angleCheck) 
					
					// В случае, если проверяемый угол оказался успешным по направлению
          if (place_free(x + _xFix, y + _yFix)) {
						// Переместить игрока
            x += _xFix * get_delta_time()
            y += _yFix * get_delta_time()
						// И завершить дальнейшую текущую проверку других углов
            exit
          }
        }
			}
		}
	}
}