function move(_collision, _speed) {
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
		var _xFix = lengthdir_x(_speed, _dir)
		var _yFix = lengthdir_y(_speed, _dir)

		// Вне зависимости от количества кадров, будет всегда одна скорость
		if (place_free(x + _xFix * 2, y + _yFix * 2)) {
			x += _xFix * get_delta_time()
			y += _yFix * get_delta_time()
		} else {
			var _sweepInterval = 1
			var _maxAngle = 90
			
			for (var _angle = _sweepInterval; _angle < _maxAngle; _angle += _sweepInterval) {
				for (var _switcher = -1; _switcher <= 1; _switcher += 2) {      
          var _angleCheck = _dir + _angle * _switcher
          _xFix = lengthdir_x(_speed, _angleCheck) * get_delta_time()
          _yFix = lengthdir_y(_speed, _angleCheck) * get_delta_time()

          if (place_free(x + _xFix, y + _yFix)) {
            x = lerp(x, x + _xFix, .5)
            y = lerp(y, y + _yFix, .5)
            exit
          }   
        }
			}
		}
	}
}