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
			var ANGLE_CHECK_INTERVAL        = 1,
			    MAX_ANGLE_CHECK             = 90,
                ON_COLLISION_LIMIT_SPEED_BY = 3;
			
			for (var angle = ANGLE_CHECK_INTERVAL; angle < MAX_ANGLE_CHECK; angle += ANGLE_CHECK_INTERVAL) {
				for (var angle_direction = -1; angle_direction <= 1; angle_direction += 2) {  
					var angleCheck = dir + angle * angle_direction;
					
			        xFix = lengthdir_x(_speed / ON_COLLISION_LIMIT_SPEED_BY, angleCheck);
			        yFix = lengthdir_y(_speed / ON_COLLISION_LIMIT_SPEED_BY, angleCheck);
					
					isMoved = _check_is_free_and_move(xFix, yFix);
					if (isMoved) exit;
				}
			}
		}
	}
}