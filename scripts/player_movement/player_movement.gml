function player_movement(_speed) {
    var _get_input = function() {
        // TODO: Custom inputs
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
    
    var _get_limited_speed = function(_speed, _limit_by) {
        return _speed / _limit_by;
    }
    
    var input = _get_input();
	if (input.x != 0 || input.y != 0) {
	    // Normalize movement in diagonal directions
		var dir  = point_direction(0, 0, input.x, input.y),
    		x_fix = lengthdir_x(_speed, dir),
    		y_fix = lengthdir_y(_speed, dir);
    		
		var isMoved = _check_is_free_and_move(x_fix, y_fix);
		if (not isMoved) {
			var ANGLE_CHECK_INTERVAL        = 1,
			    MAX_ANGLE_CHECK             = 90,
                ON_COLLISION_LIMIT_SPEED_BY = 3,

                limited_speed = _get_limited_speed(_speed, ON_COLLISION_LIMIT_SPEED_BY);
			
			for (var angle = ANGLE_CHECK_INTERVAL; angle < MAX_ANGLE_CHECK; angle += ANGLE_CHECK_INTERVAL) {
				for (var angle_direction = -1; angle_direction <= 1; angle_direction += 2) {  
					var angle_check = dir + angle * angle_direction;
					
			        x_fix = lengthdir_x(limited_speed, angle_check);
			        y_fix = lengthdir_y(limited_speed, angle_check);
					
					isMoved = _check_is_free_and_move(x_fix, y_fix);
					if (isMoved) exit;
				}
			}
		}
	}
}