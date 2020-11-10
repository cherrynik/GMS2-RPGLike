function set_item_pickable(_item, _radius, _key) {
	// Декларация переменных по умолчанию
	var _pickUp = keyboard_check_released(_key)
	var _isInRange = get_player_in_range(x, y, _radius)

	// Если в радиусе и нажата кнопка "взаимодействия"
	if (_isInRange && _pickUp) {
		// Пропарсить инвентарь на искомый предмет (в случае чего - добавить его в инвентарь)
		oPlayer.Inventory = parse_inventory(_item, oPlayer.Inventory)
	}
}