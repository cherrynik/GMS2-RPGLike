event_inherited();

Inventory = undefined;

#region
MoveByInput = function(_input = get_input_axis()) {
  if (_input.x != 0 || _input.y != 0) {
    var coords   = GetCoordsNormalized(_input, SpeedStatus.Normal),
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