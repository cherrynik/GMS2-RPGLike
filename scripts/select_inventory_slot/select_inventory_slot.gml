function select_inventory_slot(_invLink) {
	var _selectedSlot
	var _slotsCount = array_length(_invLink)

	var _mouseWheel = mouse_wheel_down() - mouse_wheel_up()

	if (_mouseWheel != 0) {
		for (var i = 0; i < _slotsCount; i++) {
			if (_invLink[i].selected) {
				_selectedSlot = i
				_selectedSlot += _mouseWheel

				if (_selectedSlot > _slotsCount - 1) {
					_selectedSlot = 0
				} else if (_selectedSlot < 0) {
					_selectedSlot = _slotsCount - 1
				}
				
				_invLink[i].selected = false
				_invLink[_selectedSlot].selected = true
				break
			}
		}
	}
}