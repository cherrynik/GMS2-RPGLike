#region Movement - Variables
Speed = {
	normal: 1,
	slowed: 1/3,
};
#endregion

#region Movement - Methods
GetInput = function() {
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

CheckIfFreeAndMove = function(_x, _y) {
    if (place_free(x + _x, y + _y)) {
		x += _x * get_delta_time(); // By delta time it's independent on game FPS
		y += _y * get_delta_time();
		return true;
	}
	return false;
}

GetCoordsNormalized = function(_input) {
    var dir   = point_direction(0, 0, _input.x, _input.y),
        x_fix = lengthdir_x(Speed.normal, dir),
        y_fix = lengthdir_y(Speed.normal, dir);
        
    return {
        x: x_fix,
        y: y_fix,
        direction: dir,
    }
}

CollideSmoothly = function(_coords) {
    var DEGREE_CHECK_INTERVAL = 1,
		MAX_DEGREE_CHECK      = 90;
			
	for (var angle = DEGREE_CHECK_INTERVAL; angle < MAX_DEGREE_CHECK; angle += DEGREE_CHECK_INTERVAL) {
		for (var angle_direction = -1; angle_direction <= 1; angle_direction += 2) {  
			var degree_check = _coords.direction + angle * angle_direction;
					
			_coords.x = lengthdir_x(Speed.slowed, degree_check);
			_coords.y = lengthdir_y(Speed.slowed, degree_check);
					
			isMoved = CheckIfFreeAndMove(_coords.x, _coords.y);
			if (isMoved) exit;
		}
	}   
}

Movement = function() {
	var input = GetInput();
	if (input.x != 0 || input.y != 0) {
	    var coords  = GetCoordsNormalized(input, Speed.normal),
	        isMoved = CheckIfFreeAndMove(coords.x, coords.y);
            
	    if (not isMoved) {
	        CollideSmoothly(coords);
	    }
	}
}
#endregion