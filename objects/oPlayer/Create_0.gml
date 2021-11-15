event_inherited();

#region Mechanic - Movement
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

MoveByInput = function(_input = GetInputAxis()) {
  if (_input.x != 0 || _input.y != 0) {
    var coords  = GetCoordsNormalized(_input, SpeedStatus.Normal),
        isMoved = CheckIfFreeAndMoveOn(coords.x, coords.y);
           
    if (not isMoved) {
      CollideSmoothlyAt(coords);
    }
  }
}
#endregion

Creature(100, { Normal: 1, Slowed: 1/3 });