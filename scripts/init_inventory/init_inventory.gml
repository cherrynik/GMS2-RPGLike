function init_inventory(_slotsCount, _slotSelected) {
	Inventory = array_create(_slotsCount, 0) // По умолчанию инвентарь представлен в виде массива с пустыми ячейками
	isInventoryFull = false // Потому не является полным
	
	// Ограничиваем на всякий случай выбранный слот, чтоб не выбиваться из потока
	_slotSelected = clamp(_slotSelected, 0, _slotsCount)
	
	for (var i = 0; i < array_length(Inventory); i++) {
		// Сгенерировать почти все слоты невыбранными
		if (i != _slotSelected) {
			Inventory[i] = { item: noone, selected: false }
		} else {
			Inventory[i] = { item: noone, selected: true }
		}
	}
}