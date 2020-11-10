function string_split(_str, _sym) {
	// Декларация переменных по умолчанию
	var _firstTime = true

	var _symbolHasFound = false // Искомый символ, что по умолчанию, пока не найден
	var _result = []

	for (var i = 1; i <= string_length(_str); i++) {
		// Текущий символ в переменную, для упрощения
		var _currentChar = string_char_at(_str, i)
		
		if (_currentChar != _sym) { // Пока текущий символ не равен искомому...
			if (!_symbolHasFound) { // И пока искомый символ не был найден
				if (_firstTime) { // Единожды...
					_result[0] = _currentChar // Проиндексировать текущий символ, присвоив его в начало массива
					_firstTime = false // Не воспроизводить далее этот кусок кода
				} else { // Присвоив, первый индекс массиву...
					_result[0] += _currentChar // Итерируем в него же символы, пока...
				}
			} else { // Не будет найден искомый символ
				if (_firstTime) { // Аналогично единожды производим ту же операцию, что и с кодом выше
					_result[2] = _currentChar
					_firstTime = false
				} else {
					_result[2] += _currentChar // Итерируем оставшийся текст после искомого символа
				}
			}
		} else { // Когда символ найден
			_result[1] = _sym // Запоминаем его один раз (на случай если его больше встречается раз, чем 1)
			_symbolHasFound = true
			_firstTime = true
		}
	}
	
	// Заключительные конвертации в целые числа
	_result[0] = int64(_result[0])

	if (array_length(_result) == 3) {
		_result[2] = int64(_result[2])
	}
	
	return _result
}