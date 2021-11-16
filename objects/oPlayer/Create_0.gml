event_inherited();

Inventory = undefined;

#region
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
        is_moved = CheckIfFreeAndMoveOn(coords.x, coords.y);
           
    if (not is_moved) {
      CollideSmoothlyAt(coords);
    }
  }
}

Player = function(_props) constructor {
  Inventory = instance_create_depth(0, 0, 0, oInventory);
  Inventory.InitSlots(3);
}
#endregion

Creature();
Player();