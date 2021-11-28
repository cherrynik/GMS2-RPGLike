Slots        = [];
ActiveSlotID = undefined;

RenderGUI = function(_x_start_from = 5, _x_gap = 30, _y_start_from = 230, _y_gap = 0) {
  for (var _id = 0; _id < array_length(Slots); ++_id) {
    if (is_struct(Slots[@ _id])) {
      draw_sprite_ext(sSlot, Slots[@ _id].Active,
	                  _x_start_from + _x_gap * (_id + 1),
					  _y_start_from + _y_gap * (_id + 1),
					  3, 3, 0, c_white, 1);
    }
  }
}

SwitchToSlot = function(_slot_id) {
  if (is_numeric(ActiveSlotID)) {
    Slots[@ ActiveSlotID].Active = false;
  }

  _slot_id = clamp_rounded(_slot_id, 0, array_length(Slots) - 1);
  ActiveSlotID = _slot_id;;
  Slots[@ ActiveSlotID].Active = true;
}

// TODO: Inverse wheel
SwitchByMouseWheel = function() {
  var _direction = global.Keymap.MouseWheelInversed ? 
                     mouse_wheel_up() - mouse_wheel_down() :
					 mouse_wheel_down() - mouse_wheel_up();

  if (_direction != 0) {
    SwitchToSlot(ActiveSlotID + _direction);
  }
}

SwitchByKeyboard = function() {
  if (is_keymap_active(global.Keymap.Inventory.Slot.First)) {
    SwitchToSlot(0);
  } else if (is_keymap_active(global.Keymap.Inventory.Slot.Second)) {
    SwitchToSlot(1);
  } else if (is_keymap_active(global.Keymap.Inventory.Slot.Third)) {
    SwitchToSlot(2);
  }
}

SwitchByInput = function() {
  SwitchByMouseWheel();
  SwitchByKeyboard();
}

InitSlots = function(_slots_count, _id_active = 0) constructor {
  for (var _id = 0; _id < _slots_count; ++_id) {
	var slot = instance_create_depth(0, 0, 0, oSlot);
	array_insert(Slots, _id, new slot.Init());
	instance_destroy(slot);
  }

  SwitchToSlot(_id_active);
}