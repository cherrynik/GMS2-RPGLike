function parse_inventory( _item, _invLink) {
	// Декларация переменных по умолчанию
	var _invSlots = array_length(_invLink)
	var _again = false // Глобальная переменная для памяти

	// Если инвентарь не полон
	if (!oPlayer.isInventoryFull) {
		// Начать "прогон" по инвентарю
		for (var i = 0; i < _invSlots; i++) {
			// Запомнить переменные
			var _slotEmpty = (_invLink[i].item == noone)
			var _slotLast = _invSlots - 1

			// Если это первый "прогон"
			if (!_again) {
				// Если текущий слот не пустой и не является последним
				if (!_slotEmpty && (i != _slotLast)) {
					// Если название подобранного предмета равняется уже сохранённому предмету в инвентаре,
					// а также не превышает заданное максимальное количество данного предмета...
					if ((_item.name == _invLink[i].item.name) && (_item.maxCount > _invLink[i].count)) {
						_invLink[i].count++ // Увеличить кол-во данного предмета
						instance_destroy(self) // Уничтожить его на земле
						break
					}
				} else if ((i == _slotLast) && !_again) { // Если это последний слот и был первый "прогон"
					_again = true
					i = -1 // Начать сначала
				}
			} else { // Если это "прогон" заново
				if (_slotEmpty) { // Если слот пустой
					_invLink[i].item = _item // Заполнить слот подобранным предметом
					_invLink[i].count = 1 // И присвоить количество данного предмета
					instance_destroy(self) // Уничтожить его на земле
					break
				} else if (!_slotEmpty && (i == _slotLast)) { // Если слот не пустой и уже последний
					oPlayer.isInventoryFull = true // Смириться с тем, что инвентарь пуст...
					break
				}
			}
		}
	}

	// Покинуть "помещение" (скрипт)
	return _invLink
}