function get_item_name_by_id(_itemsStruct, _id) {
	if ((is_undefined(_id)) || (_id == 0)) { // Если айди не существует или равен нулю
		return noone // Вернуть пустой предмет (ничего)
	}
	
	var _struct = variable_struct_get_names(_itemsStruct) // Получить все подструктуры структуры
	var _structSize = array_length(_struct) // Запомнить результат длины всех структур

	for (var i = 0; i < _structSize; i++) {
		// Сверить каждую структуру по айди...
		var _currentStruct = variable_struct_get(_itemsStruct, _struct[i])

		// ... с искомым айди
		if (_currentStruct.id == _id) {
			return _currentStruct.name // Вернуть имя предмета, в случае успеха
		}
	}
}