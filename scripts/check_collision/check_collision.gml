function check_collision(_dirParent, _collision, _radius, _angle, _stepBy) {
	var _coordsCheck = {
		topRight: [bbox_right + 1, bbox_top - 1],
		topLeft: [bbox_left - 1, bbox_top - 1],
		bottomRight: [bbox_right + 1, bbox_bottom + 1],
		bottomLeft: [bbox_left - 1, bbox_bottom + 1],
	}
	
	_object = _collision
	function _collision_point(_corner) {
		return collision_point(_corner[0], _corner[1], _object, true, true)
	}
	
	//function _collision_line(_corner) {
	//	return collision_line(_corner[0], _corner[1])
	//}

	lowerAngle = noone

	//draw_set_color(c_red)
	//draw_rectangle(bbox_left - 1, bbox_bottom + 1, bbox_right + 1, bbox_top - 1, true)
	

	if (_dirParent.result == _dirParent.orientations[1]) {
		if (_collision_point(_coordsCheck.topRight) && !_collision_point(_coordsCheck.bottomRight)) {
			show_debug_message("Top Right to Right")
			var checkOn = 5;
			var _moveTo
			var _xFix
			var _yFix
			var canI = false

			for (var i = 0; i < 90; i += 1) {
				var _currentRadian = i * pi / 180
				
				//if (
				//	!collision_point(
				//		_coordsCheck.topRight[0] + cos(_currentRadian),
				//		_coordsCheck.topRight[1] + sin(_currentRadian), _collision, true, true
				//	))
				//{
				
				draw_set_color(c_black)
				draw_line(
					_coordsCheck.topRight[0], _coordsCheck.topRight[1],
					_coordsCheck.topRight[0] + cos(_currentRadian) * checkOn,
					_coordsCheck.topRight[1] + sin(_currentRadian) * checkOn
				)
				
				for (var j = 0; j < checkOn; j += 2) {
					if (!collision_point(_coordsCheck.topRight[0] + cos(_currentRadian) * j, _coordsCheck.topRight[1] + sin(_currentRadian) * j, _collision, true, true)) {
						draw_set_color(c_red)
						draw_line(
							_coordsCheck.topRight[0], _coordsCheck.topRight[1],
							_coordsCheck.topRight[0] + cos(_currentRadian) * j,
							_coordsCheck.topRight[1] + sin(_currentRadian) * j
						)
						_moveTo = point_direction(0, 0, cos(_currentRadian) * j, sin(_currentRadian) * j)
						_xFix = lengthdir_x(1 * i / 90, _moveTo)
						_yFix = lengthdir_y(1 * i / 90, _moveTo)
						
						show_debug_message([i, j])
					
						if (place_empty(x + _xFix, y + _yFix, _collision)) {
							canI = true
							break
						}
						//|| !collision_line(x, y, x + cos(_currentRadian) * 5, y + sin(_currentRadian) * 5, _collision, true, true)
					}
				}
						if (canI) {
							x += _xFix 
							y += _yFix
							canI = false
							break
						}
						//show_debug_message(place_empty(x + _xFix, y + _yFix))
						//show_debug_message(["X: ", x, "Y: ", y, "X To: ", (x + lengthdir_x(2 * i / 90, _moveTo)), "Y To: ", (y + lengthdir_y(2 * i / 90, _moveTo))])
				}

		} else if (!_collision_point(_coordsCheck.topRight) && _collision_point(_coordsCheck.bottomRight)) {
			show_debug_message("Bottom Right to Right")
			// TODO: ...
		}
	} else if (_dirParent.result == _dirParent.orientations[3]) {
		if (_collision_point(_coordsCheck.topLeft) && !_collision_point(_coordsCheck.bottomLeft)) {
			show_debug_message("Top Left to Left")
			// TODO: ...
		} else if (!_collision_point(_coordsCheck.topLeft) && _collision_point(_coordsCheck.bottomLeft)) {
			show_debug_message("Bottom Left to Left")
			// TODO: ...
		}
	}
}