function select_inventory_slot(_invLink) {
	// Декларация переменных
	var _selectedSlot
	var _slotsCount = array_length(_invLink)

	// Получить в данный момент значение (не-)прокрученного колесика
	var _mouseWheel = mouse_wheel_down() - mouse_wheel_up()

	// Если колесико прокручено
	if (_mouseWheel != 0) {
		// Через цикл...
		for (var i = 0; i < _slotsCount; i++) {
			// Выбрать слот по условию
			if (_invLink[i].selected) {
				_selectedSlot = i // Запомнить выбранный слот
				_selectedSlot += _mouseWheel // Прибавить к памяти будущий активный слот
				
				// Если запомнившийся слот выбивается...
				if (_selectedSlot > _slotsCount - 1) { // ... из потока справа
					_selectedSlot = 0 // Ограничить слева нулём (от правого края)
				} else if (_selectedSlot < 0) { // Или ... из потока слева
					_selectedSlot = _slotsCount - 1 // Ограничить справа максимальным индексом (от левого края)
				}
				
				_invLink[i].selected = false // Предыдущий слот деактивировать
				_invLink[_selectedSlot].selected = true // Запомнившийся слот активировать
				break
			}
		}
	}
}