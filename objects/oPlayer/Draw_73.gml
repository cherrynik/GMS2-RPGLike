//draw_ellipse(x - 2, y + 6, x + 16, y + 18, true)
//var _coords = [
//	bbox_top - 1,
//	bbox_right + 1,
//	bbox_bottom + 1,
//	bbox_left - 1
//]

check_collision(Direction, Collision, 5, 90, .1)

//var _collision = oCollisionTest
//var _radius = 5
//var _angle = 90
//var _stepBy = .1

//lowerAngle = noone

//draw_set_color(c_red)
//draw_rectangle(bbox_left - 1, bbox_bottom + 1, bbox_right + 1, bbox_top - 1, true)


//for (var i = 0; i < _angle; i += _stepBy) {
//	var _dir = ""

//	if (dir != []) {
//		switch (round(dir[0])) {
//			case 0: _dir = (dir[1] != 0) ? "" : "staying" break
//			case 1:
//				_dir = "forward"
//				_coords[0] = sprite_width - 4
//				break
//			case -1:
//				_dir = "backward"
//				_coords[0] = 2
//				break
//		}
	
//		switch (round(dir[1])) {
//			case 1:
//				if (_dir != "") {
//					_dir = _dir + " " + "bottom" 
//				} else {
//					_dir = "bottom"
//				}
//				_coords[1] = sprite_height
//				break
//			case -1:
//				if (_dir != "") {
//					_dir = _dir + " " + "top"
//				} else {
//					_dir = "top" 
//				}
//				_coords[1] = sprite_height - 4
//				break
//		}
//	}
	
//	var _currentX = x + _coords[0]
//	var _currentY = y + _coords[1]
	
//	var _currentRadian = i * pi / 180
//	var _lineToX = sin(_currentRadian) * _radius
//	var _lineToY = cos(_currentRadian) * _radius * dir[1]
	
//	#region Checking collision
//		var _checkCollision = {
//			horizontal: [
//				[
//					x + _coords[0] + cos(_currentRadian) * _radius * dir[0],
//					y + _coords[1] - sin(_currentRadian) * _radius
//				],

//				[
//					x + _coords[0] + cos(_currentRadian) * _radius * dir[0],
//					y + _coords[1] + sin(_currentRadian) * _radius
//				]
//			],
		
//			vertical: [
//				[
//					x + _coords[0] - sin(_currentRadian) * _radius,
//					y + _coords[1] + cos(_currentRadian) * _radius * dir[1]
//				],
			
//				[
//					x + _coords[0] + sin(_currentRadian) * _radius,
//					y + _coords[1] + cos(_currentRadian) * _radius * dir[1]
//				]
//			]
//		}
//		var _XTop = collision_line(_currentX, _currentY, _checkCollision.horizontal[0][0], _checkCollision.horizontal[0][1], oCollisionTest, true, true)
//		var _XBottom = collision_line(_currentX, _currentY, _checkCollision.horizontal[1][0], _checkCollision.horizontal[1][1], oCollisionTest, true, true)
//	#endregion
	
//	if (dir[0] != 0 && dir[1] == 0) {
//		if (!place_empty(x + _radius * dir[0], y, _collision)) {
//			if (!collision_line(_currentX, _currentY, _checkCollision.horizontal[0][0], _checkCollision.horizontal[0][1], _collision, true, true)) {
//				if (lowerAngle != noone) lowerAngle = i > lowerAngle ? lowerAngle : i
//				else lowerAngle = i
				
//				var _moveTo = point_direction(_currentX, _currentY, _currentX - _checkCollision.horizontal[0][0], _currentY - _checkCollision.horizontal[0][1])
//				//show_debug_message([global.Player.defaultSpeed * lowerAngle / 90])

//				var _xFix = lengthdir_x(global.Player.defaultSpeed * lowerAngle / 90, _moveTo)
//				var _yFix = lengthdir_y(global.Player.defaultSpeed * lowerAngle / 90, _moveTo)
				
//				if (place_empty(_xFix, _yFix, _collision)) {
//					show_debug_message(true)
//					x += _xFix * get_delta_time()
//					y += _yFix * get_delta_time()
//				}
				
				
				//draw_line(
				//	x + _coords[0], y + _coords[1],
		
				//	_checkCollision.horizontal[0][0], _checkCollision.horizontal[0][1]
				//)
	//		}
	//	}
	//}
	
	
	//if (_placeEmptyPos) {
	//	if (lowerAngle != noone) {
	//		lowerAngle = i > lowerAngle ? lowerAngle : i
	//	} else {
	//		lowerAngle = i
	//	}
	//} else if (_placeEmptyNeg) {
	//	if (lowerAngle != noone) {
	//		lowerAngle = -i < lowerAngle ? lowerAngle : i
	//	} else {
	//		lowerAngle = -i
	//	}
	//}
	
	// Debugging
	//// Horizontal
	//draw_line(
	//	x + _coords[0], y + _coords[1],
		
	//	_checkCollision.horizontal[0][0], _checkCollision.horizontal[0][1]
	//)
	
	//draw_line(
	//	x + _coords[0], y + _coords[1],
		
	//	_checkCollision.horizontal[1][0], _checkCollision.horizontal[1][1]
	//)
	
	//// Vertical (half-part - left)
	//draw_line(
	//	x + _coords[0], y + _coords[1],
		
	//	_checkCollision.vertical[0][0], _checkCollision.vertical[0][1]
	//)
	
	//draw_line(
	//	x + _coords[0], y + _coords[1],

	//	_checkCollision.vertical[1][0], _checkCollision.vertical[1][1]
	//)
//}

