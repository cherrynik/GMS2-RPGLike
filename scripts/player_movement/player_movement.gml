#macro LIMIT_ON_COLLISION 3

function player_movement(_speed) {
	var left  = keyboard_check(vk_left);
	var right = keyboard_check(vk_right);
	var up    = keyboard_check(vk_up);
	var down  = keyboard_check(vk_down);

	// Векторное направление движения игрока по осям
	HORIZONTAL = right - left;
	VERTICAL   = down - up;

	if (HORIZONTAL != 0 || VERTICAL != 0) {
		/*
		 * Выравниваем скорость во всех направлениях
		 */
		
		// Задаём направление на векторной плоскости
		var dir = point_direction(0, 0, HORIZONTAL, VERTICAL);
		// Присваиваем скорость изменения переменной
		var xFix = lengthdir_x(_speed, dir);
		var yFix = lengthdir_y(_speed, dir);
		// Выровняли

		if (place_free(x + xFix, y + yFix)) {
			x += xFix * get_delta_time(); // Вне зависимости от количества кадров, будет всегда одна скорость
			y += yFix * get_delta_time();
		} else {
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
					if (place_free(x + xFix, y + yFix)) {
			            x += xFix * get_delta_time();
			            y += yFix * get_delta_time();
						// Завершить дальнейшую проверку других углов
						exit;
					}
				}
			}
		}
	}
}