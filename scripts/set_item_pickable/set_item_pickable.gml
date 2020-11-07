function set_item_pickable(_item, _radius, _key) {
	var _pickUp = keyboard_check_released(_key)
	var _isInRange = get_player_inrange(x, y, _radius)

	if (_isInRange & _pickUp) {
		oPlayer.Inventory = parse_inventory(_item, oPlayer.Inventory)
	}
}