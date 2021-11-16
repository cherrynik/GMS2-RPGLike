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

  ActiveSlotID = _slot_id;;
  Slots[@ ActiveSlotID].Active = true;
}

InitSlots = function(_slots_count, _id_active = 0) constructor {
  Slots = array_create(_slots_count, undefined);

  for (var _id = 0; _id < _slots_count; ++_id) {
	var slot = instance_create_depth(0, 0, 0, oSlot);
	array_insert(Slots, _id, new slot.Init());
	instance_destroy(slot);
  }
  
  if (_id_active > _slots_count) {
	throw("Active slot is out of boundaries");
  }

  SwitchToSlot(_id_active);
}