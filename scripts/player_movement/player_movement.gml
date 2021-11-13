function player_movement(_speed) {
    get_input = function() {
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
	
    get_limited_speed = function(_speed, _limit_by) {
        return _speed / _limit_by;
    }
    
    check_is_free_and_move = function(_x, _y) {
       if (place_free(x + _x, y + _y)) {
			x += _x * get_delta_time(); // By delta time it's independent on game FPS
			y += _y * get_delta_time();
			return true;
		}
		return false;
    }
    
    get_normalized = function(_input, _speed) {
        var dir   = point_direction(0, 0, _input.x, _input.y),
            x_fix = lengthdir_x(_speed, dir),
            y_fix = lengthdir_y(_speed, dir);
        
        return {
            x: x_fix,
            y: y_fix,
            direction: dir,
        }
    }
    
    collision_smooth = function(_coords, _speed) {
        var DEGREE_CHECK_INTERVAL        = 1,
			MAX_DEGREE_CHECK             = 90,
            ON_COLLISION_LIMIT_SPEED_BY  = 3, 

            limited_speed = get_limited_speed(_speed, ON_COLLISION_LIMIT_SPEED_BY);
			
		for (var angle = DEGREE_CHECK_INTERVAL; angle < MAX_DEGREE_CHECK; angle += DEGREE_CHECK_INTERVAL) {
			for (var angle_direction = -1; angle_direction <= 1; angle_direction += 2) {  
				var degree_check = _coords.direction + angle * angle_direction;
					
			    _coords.x = lengthdir_x(limited_speed, degree_check);
			    _coords.y = lengthdir_y(limited_speed, degree_check);
					
				isMoved = check_is_free_and_move(_coords.x, _coords.y);
				if (isMoved) exit;
			}
		}   
    }
	
	main = function(_speed) {
		var input = get_input();
	    if (input.x != 0 || input.y != 0) {
	        var coords = get_normalized(input, _speed),
	            isMoved = check_is_free_and_move(coords.x, coords.y);
            
	        if (not isMoved) {
	            collision_smooth(coords, _speed);
	        }
	    }	
	}(_speed);
}