#region Movement - Variables
Speed = {
  normal: 1,
  slowed: 1/3,
};
#endregion

#region Movement - Methods
GetInputAxis = function() {
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

CheckIfFreeAndMoveOn = function(_x, _y) {
  if (place_free(x + _x, y + _y)) {
    x += _x * get_delta_time(); // By delta time it's independent on game FPS
    y += _y * get_delta_time();
    return true;
  }
  return false;
}

GetCoordsNormalized = function(_coords) {
  // TODO: Replace speed on current value
  var dir   = point_direction(0, 0, _coords.x, _coords.y),
      y_fix = lengthdir_y(Speed.normal, dir),
	  x_fix = 0;
	  
  if (_coords.x != .0) {
	x_fix = lengthdir_x(Speed.normal, dir);
  }
      
  return {
    x: x_fix,
    y: y_fix,
    direction: dir,
  }
}

CollideSmoothlyAt = function(_coords) {
  var DEGREE_CHECK_INTERVAL = 5,
  	  MAX_DEGREE_CHECK      = 90;
  		
  for (var angle = DEGREE_CHECK_INTERVAL; angle < MAX_DEGREE_CHECK; angle += DEGREE_CHECK_INTERVAL) {
	// TODO: Flexible switcher: calc shortest edge and flip -1 or 1
  	for (var angle_direction = -1; angle_direction <= 1; angle_direction += 2) {
  	  var degree_check = _coords.direction + angle * angle_direction;

  	  _coords.x = lengthdir_x(Speed.slowed, degree_check);
  	  _coords.y = lengthdir_y(Speed.slowed, degree_check);
  	  		
  	  isMoved = CheckIfFreeAndMoveOn(_coords.x, _coords.y);
  	  if (isMoved) {
		return true;
	  }
  	}
  }
  return false;
}

MoveByInput = function(_input = GetInputAxis()) {
  if (_input.x != 0 || _input.y != 0) {
    var coords  = GetCoordsNormalized(_input, Speed.normal),
        isMoved = CheckIfFreeAndMoveOn(coords.x, coords.y);
           
    if (not isMoved) {
      CollideSmoothlyAt(coords);
    }
  }
}
#endregion