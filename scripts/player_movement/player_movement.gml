#macro LIMIT_ON_COLLISION 3

function player_movement(_speed) {
    var _get_input = function() {
    	var left  = keyboard_check(vk_left),
    	    right = keyboard_check(vk_right),
    	    up    = keyboard_check(vk_up),
    	    down  = keyboard_check(vk_down);
    
    	return {
    	    x: right - left,
    	    y: down - up
    	}
    }
    
    var _check_is_free_and_move = function(_x, _y) {
       if (place_free(x + _x, y + _y)) {
			x += _x * get_delta_time(); // By delta time it's independent on game FPS
			y += _y * get_delta_time();
			return true;
		}
		return false;
    }
    
    var input = _get_input();
	if (input.x != 0 || input.y != 0) {
	    // Normalize movement in diagonal directions
		var dir = point_direction(0, 0, input.x, input.y),
    		xFix = lengthdir_x(_speed, dir),
    		yFix = lengthdir_y(_speed, dir);
    		
		var isMoved = _check_is_free_and_move(xFix, yFix);

		if (not isMoved) {
			var sweepInterval = 1; // Интервал проверки углов, в арифметической прогрессии - это d
			var maxAngle = 90; // Максимальный угол "обтекания" угла/стены
			
			// Прогнать направление под текущим углом...
			for (var angle = sweepInterval; angle < maxAngle; angle += sweepInterval) {
				// В две стороны (с помощью switcher'а)
				for (var switcher = -1; switcher <= 1; switcher += 2) {  
					/*
					 * Текущее направление на векторной плоскости
					 * применить под текущим проверяемым углом
					 */
					var angleCheck = dir + angle * switcher;
					/*
					 * Присваиваем скорость изменения переменной
					 * в направлении под текущим углом
					 * "замедленной", по умолчанию
					 */
			        xFix = lengthdir_x(_speed / LIMIT_ON_COLLISION, angleCheck);
			        yFix = lengthdir_y(_speed / LIMIT_ON_COLLISION, angleCheck);
					
					// Если проверяемый угол оказался успешным по направлению...
					isMoved = _check_is_free_and_move(xFix, yFix);
					if (isMoved) exit;
				}
			}
		}
	}
}